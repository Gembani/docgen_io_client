require 'open-uri'
module DocgenIoClient
  class Document < Resource
    has_one :template_render
    attributes :support_files
    def pdf
      open("#{Client.base_url}/documents/#{id}/view/pdf?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end

    def tex
      open("#{Client.base_url}/documents/#{id}/view/tex?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end

    def log
      open("#{Client.base_url}/documents/#{id}/view/log?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end
  end
end
