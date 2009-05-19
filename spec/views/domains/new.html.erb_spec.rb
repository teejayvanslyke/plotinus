require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/new.html.erb" do
  include DomainsHelper
  
  before(:each) do
    assigns[:domain] = stub_model(Domain,
      :new_record? => true,
      :creator_id => 1,
      :name => "value for name"
    )
  end

  it "renders new domain form" do
    render
    
    response.should have_tag("form[action=?][method=post]", domains_path) do
      with_tag("input#domain_creator_id[name=?]", "domain[creator_id]")
      with_tag("input#domain_name[name=?]", "domain[name]")
    end
  end
end


