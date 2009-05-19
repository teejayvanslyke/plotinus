require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/show.html.erb" do
  include DomainsHelper
  before(:each) do
    assigns[:domain] = @domain = stub_model(Domain,
      :creator_id => 1,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/1/)
    response.should have_text(/value\ for\ name/)
  end
end

