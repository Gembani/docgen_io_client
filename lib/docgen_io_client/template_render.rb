module DocgenIoClient
  class TemplateRender < Resource
    attributes :name, :params
    has_one :template
    has_one :document
  end
end
