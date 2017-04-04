module DocgenIoClient
  class TemplateRender < Resource
    attributes :name, :field_values
    has_one :template
    has_one :document
    resource_type :"template-renders"
  end
end
