require 'open-uri'
module DocgenIoClient
  class Compile < Resource
    has_one :render
    resource_type :compiles
    def pdf
      open("http://api.docgen.io/compiles/#{id}/view/pdf?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end
    
    def tex
      open("http://api.docgen.io/compiles/#{id}/view/tex?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end

    def log
      open("http://api.docgen.io/compiles/#{id}/view/log?token=#{ENV.fetch('DOCGEN_API_KEY').freeze}")
    end
  end
end
