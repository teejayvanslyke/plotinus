require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/predicates/show.html.erb" do
  include PredicatesHelper
  before(:each) do
    assigns[:predicate] = @predicate = stub_model(Predicate,
      :name => "value for name"
    )
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ name/)
  end
end
