module DocgenIoClient
  class Resource
    class << self;
      attr_accessor :attribute_keys
      attr_accessor :resource_type_name
      attr_accessor :has_ones
      attr_accessor :has_manys

      def find(id)
        client = Client.new
        self.send(:new, client.find(self.resource_type_name, id))
      end

      def all()
        client = Client.new
        self.send(:new, client.all(self.resource_type_name))
        array = client.all(self.resource_type_name)[:data]
        array.map { |item|   self.send(:new, item) }

      end
      def create(payload)
        resource = self.new()
        payload.keys.each do |key|
          resource.send("#{key}=", payload[key])
        end
        resource.save
        resource
      end
      def attributes(*args)
          self.attribute_keys = [] if self.attribute_keys.nil?
          self.attribute_keys = self.attribute_keys + args
      end

      def has_many(*args)
          self.has_manys = [] if self.has_manys.nil?
          self.has_manys = self.has_manys + args
      end
      def has_one(*args)
          self.has_ones = [] if self.has_ones.nil?
          self.has_ones = self.has_ones + args
      end

      def resource_type(resource_type)
        @resource_type_name = resource_type
      end
    end

    def has_many_translate(data)
      data.map do |item|
        Object.const_get("DocgenIoClient::#{item[:type].to_s.classify}").new(data: item)
      end
    end
    def has_one_methods
      (class_has_ones + class_has_manys).each do |key, data|
          create_method(key) do
            if @relationships[key.to_s.dasherize.to_sym].nil? && id
              client = Client.new
              response = RestClient.get("#{@payload[:relationships][key.to_s.dasherize.to_sym][:links][:related]}", client.headers)
              json = JSON.parse(response, symbolize_names: true)
              if json[:data].class == Array
                @relationships[key.to_s.dasherize.to_sym] = has_many_translate(json[:data])
              else
                @relationships[key.to_s.dasherize.to_sym] = Object.const_get("DocgenIoClient::#{key.capitalize.to_s.classify}").new(json)
              end
            end
            return @relationships[key.to_s.dasherize.to_sym]
          end

          create_method("#{key}=") do |resource|
            @relationships[key.to_s.dasherize.to_sym] = resource
          end
      end
    end

    def attribute_methods
      class_attribute_keys.each do |key, data|
          create_method(key) do
            return @payload[:attributes][key.to_s.dasherize.to_sym]
          end

          create_method("#{key}=") do |value|
            @payload[:attributes][key.to_s.dasherize.to_sym] = value
          end
      end
    end

    def initialize(config = {})
      @payload = config[:data] || {attributes: {}}

      @relationships = Relationships.new
      has_one_methods
      attribute_methods
    end

    def id
      @payload[:id]
    end
    def to_related_payload
      {data: {
        id: self.id,
        type: self.type
      }}
    end
    def type
      @payload[:type] || self.class.resource_type_name
    end

    def class_has_ones
      self.class.has_ones || []
    end
    def class_has_manys
      self.class.has_manys|| []
    end

    def save
      client = Client.new
      if id
        @payload = client.update(self.class.resource_type_name, id, to_json)[:data]
      else
        @payload = client.create(self.class.resource_type_name, to_json)[:data]
      end
      self
    end
    def to_json
      data = {relationships: @relationships.to_json, attributes: @payload[:attributes],  type: type}
      if id
        data[:id] = id
      end
      data
    end
    def create_method(name, &block)
      self.class.send(:define_method, name, &block)
    end

    def class_attribute_keys
      self.class.attribute_keys || []
    end
  end
end
