require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/index.html.erb" do
  include DomainsHelper
  
  before(:each) do
    assigns[:domains] = [
      stub_model(Domain,
        :creator_id => 1,
        :name => "value for name"
      ),
      stub_model(Domain,
        :creator_id => 1,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of domains" do
    render
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

