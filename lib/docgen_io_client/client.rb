module DocgenIoClient
  class Client
    def self.api_key
      ENV.fetch('DOCGEN_API_KEY').freeze
    end
    def self.base_url
      ENV['DOCGEN_BASE_URL'] || 'http://api.docgen.io'
    end
    def initialize()
      @api_key =  self.class.api_key
      @base_url = self.class.base_url
    end

    def headers
        {
          "Accept": "application/vnd.api+json",
          "Content-Type": "application/vnd.api+json",
          "Authorization": "Bearer #{@api_key}"
        }
    end

    def find(resource, id, url = false)
      response = RestClient.get("#{@base_url}/#{resource}/#{id}", headers)
      json = JSON.parse(response, symbolize_names: true)
      json
    end

    def create(resource, payload)
      response = RestClient.post("#{@base_url}/#{resource}",JSON.generate({data: payload}),headers)
      JSON.parse(response, symbolize_names: true)
    end

    def update(type, id, payload)
      response = RestClient.patch("#{@base_url}/#{type}/#{id}",JSON.generate({data: payload}),headers)
      JSON.parse(response, symbolize_names: true)
    end
  end
end
