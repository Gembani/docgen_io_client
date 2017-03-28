module DocgenIoClient
  class Document < Resource
    attributes :texfile, :title
    resource_type :documents
    has_many :renders
  end

end
