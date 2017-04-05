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

  it "create a template" do
    template = DocgenIoClient::Template.new
    begin
    template.texfile = "texfile<% company_name %>"
    template.support_files = [{content: "support_file<% company_name %>", path: "support.tex"}]
    template.save

    template_render = DocgenIoClient::TemplateRender.new
    template_render.field_values = {company_name: "Nicks comapny"}
    template_render.template = template
    template_render.save
    template_render.document
    expect(template_render.document).not_to eq(nil)

    #
    # resource = client.update(document)
    # document = client.find('documents', 2)


    rescue RestClient::ExceptionWithResponse => e
      e.response.body
    end

    #document = client.find('documents', 2)

  end

end
