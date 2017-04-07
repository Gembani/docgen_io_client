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

  it "create a template" do
    template = DocgenIoClient::Template.new
    template.tex_file = "texfile<% company_name %>"
    template.other_files = [{content: "support_file<% company_name %>", path: "support.tex"}]
    expect { template.save}.to_not raise_error
  end

  

  it "create a template render" do
    template = DocgenIoClient::Template.new
    template.tex_file = "texfile<% company_name %>"
    template.other_files = [{content: "support_file<% company_name %>", path: "support.tex"}]
    template.save

    template_render = DocgenIoClient::TemplateRender.new
    template_render.params = {company_name: "Nicks comapny"}
    template_render.template = template
    expect { template_render.save}.to_not raise_error
    expect(template_render.document).not_to eq(nil)

  end

end
