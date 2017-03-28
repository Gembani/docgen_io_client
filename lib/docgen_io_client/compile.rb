module DocgenIoClient
  class Compile < Resource
    has_one :render
    resource_type :compiles
  end
end
