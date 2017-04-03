module DocgenIoClient
  class Template < Resource
    attributes :texfile, :title
    resource_type :templates
    has_many :template_renders
  end

end
