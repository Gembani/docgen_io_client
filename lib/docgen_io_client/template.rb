module DocgenIoClient
  class Template < Resource
    attributes :texfile, :title, :support_files
    resource_type :templates
    has_many :template_renders
  end

end
