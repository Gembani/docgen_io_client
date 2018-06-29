require "spec_helper"

RSpec.describe DocgenIoClient::Resource do
  describe "#all" do
    let(:resource) do
      {
        id: "1",
        type: "resources",
        attributes: {
          my_attribute: 'my_attribute_value'
        }
      }
    end

    let(:payload) do
      {
        data: [
          resource
        ]
      }
    end

    let(:resource_all) { DocgenIoClient::Resource.all }

    before(:each) do
      DocgenIoClient::Resource.attributes :my_attribute
      allow_any_instance_of(DocgenIoClient::Client).to receive(:all).and_return(payload)
    end

    it "returns a JSON API view of each object" do
      expect(resource_all[0].id).to eq(resource[:id])
      expect(resource_all[0].my_attribute).to eq(resource[:attributes][:my_attribute])
    end
  end
end
