module DocgenIoClient
  class Relationships
    attr_accessor :data
    def initialize(hash={})
      @data = hash
    end

    def [](key)
      data[key]
    end

    def []=(key, resource)
      data[key] = resource
    end
    def to_json
      @data.keys.inject({}) do |total, key|
        total[key] = data[key].to_related_payload
        total
      end
    end
  end
end
