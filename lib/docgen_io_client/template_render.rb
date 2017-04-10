require 'open-uri'

module DocgenIoClient
  class TemplateRender < Resource
    attributes :name, :params, :pdf, :tex, :log
    has_one :template
    has_one :document
    def pdf_object
      open("#{pdf}/?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end
    def tex_object
      open("#{tex}/?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end
    def log_object
      open("#{log}/?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end

  end
end
