require "spec_helper"

require 'dotenv/load'
require 'byebug'
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
    template = DocgenIoClient::Template.new
    begin
    template.texfile = "lol"
    template.save

    template_render = DocgenIoClient::TemplateRender.new
    template_render.field_values = {founders: [{ name: "Nick Stock"}, { name:"Thomas Stock"}]}
    template_render.template = template
    template_render.save
    document = DocgenIoClient::Document.new
    document.template_render = template_render
    document.save
    document =  DocgenIoClient::Document.find(document.id)
    expect(document.template_render).not_to eq(nil)

    #
    # resource = client.update(document)
    # document = client.find('documents', 2)


    puts "hello"
    rescue RestClient::ExceptionWithResponse => e
      byebug
      e.response.body
    end

    #document = client.find('documents', 2)

  end

end
