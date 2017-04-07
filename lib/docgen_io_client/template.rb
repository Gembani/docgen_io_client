module DocgenIoClient
  class Template < Resource
    attributes :tex_file, :title, :other_files
    has_many :template_renders
  end
end
