require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Triple do
  before(:each) do
    @valid_attributes = {
      :entity1 => "value for entity1",
      :entity2 => "value for entity2",
      :predicate_id => 1,
      :author_id => 1,
      :domain_id => 1
    }
  end

  it "should create a new instance given valid attributes" do
    Triple.create!(@valid_attributes)
  end
end
