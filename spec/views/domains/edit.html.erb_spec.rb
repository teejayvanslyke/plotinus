require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/domains/edit.html.erb" do
  include DomainsHelper
  
  before(:each) do
    assigns[:domain] = @domain = stub_model(Domain,
      :new_record? => false,
      :creator_id => 1,
      :name => "value for name"
    )
  end

  it "renders the edit domain form" do
    render
    
    response.should have_tag("form[action=#{domain_path(@domain)}][method=post]") do
      with_tag('input#domain_creator_id[name=?]', "domain[creator_id]")
      with_tag('input#domain_name[name=?]', "domain[name]")
    end
  end
end


