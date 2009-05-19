require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/predicates/new.html.erb" do
  include PredicatesHelper
  
  before(:each) do
    assigns[:predicate] = stub_model(Predicate,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new predicate form" do
    render
    
    response.should have_tag("form[action=?][method=post]", predicates_path) do
      with_tag("input#predicate_name[name=?]", "predicate[name]")
    end
  end
end


