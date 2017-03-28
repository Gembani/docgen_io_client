module DocgenIoClient

  class Render < Resource
    attributes :name, :'field-values'
    has_one :document
    resource_type :renders
  end
end
