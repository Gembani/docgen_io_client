require 'open-uri'
module DocgenIoClient
  class Compile < Resource
    has_one :render
    resource_type :documents
    def pdf
      open("#{Client.base_url}/compiles/#{id}/view/pdf?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end

    def tex
      open("#{Client.base_url}/compiles/#{id}/view/tex?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end

    def log
      open("#{Client.base_url}/compiles/#{id}/view/log?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end
  end
end
