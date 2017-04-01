require "spec_helper"

require 'dotenv/load'

# or
require 'dotenv'
Dotenv.load
RSpec.describe DocgenIoClient do
  let(:payload) do
    {data: {
    attributes: {
        title: "this is the new title",
        texfile: "latex new file content"
      },
        id: 19,
        type: "documents"
      }
    }
  end
  it "has a version number" do
    expect(DocgenIoClient::VERSION).not_to be nil
  end

  xit "does something useful" do
    data = DocgenIoClient::Resource.new(payload)
    expect(data.title).to eq("this is the new title")
    data.title = "new_title"
    expect(data.payload[:attributes][:title]).to eq("new_title")
  end

  xit "asdafsd" do
    data = DocgenIoClient::Resource.new(payload)
    data.title = "new_title"
    expect(data.payload[:attributes][:title]).to eq("new_title")
  end

  it "create a document" do
    document = DocgenIoClient::Document.new
    begin
    document.texfile = "lol"
    document.save

    render = DocgenIoClient::Render.new
    render.field_values = {founders: [{ name: "Nick Stock"}, { name:"Thomas Stock"}]}
    render.document = document
    render.save
    #
    # resource = client.update(document)
    # document = client.find('documents', 2)


    puts "hello"
    rescue RestClient::ExceptionWithResponse => e
      e.response.body
    end

    #document = client.find('documents', 2)

  end

end
