require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/predicates/edit.html.erb" do
  include PredicatesHelper
  
  before(:each) do
    assigns[:predicate] = @predicate = stub_model(Predicate,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit predicate form" do
    render
    
    response.should have_tag("form[action=#{predicate_path(@predicate)}][method=post]") do
      with_tag('input#predicate_name[name=?]', "predicate[name]")
    end
  end
end


