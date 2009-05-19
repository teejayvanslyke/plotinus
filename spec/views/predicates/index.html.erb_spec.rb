require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/predicates/index.html.erb" do
  include PredicatesHelper
  
  before(:each) do
    assigns[:predicates] = [
      stub_model(Predicate,
        :name => "value for name"
      ),
      stub_model(Predicate,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of predicates" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end

