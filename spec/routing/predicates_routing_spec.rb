require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PredicatesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "predicates", :action => "index").should == "/predicates"
    end
  
    it "maps #new" do
      route_for(:controller => "predicates", :action => "new").should == "/predicates/new"
    end
  
    it "maps #show" do
      route_for(:controller => "predicates", :action => "show", :id => "1").should == "/predicates/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "predicates", :action => "edit", :id => "1").should == "/predicates/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "predicates", :action => "create").should == {:path => "/predicates", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "predicates", :action => "update", :id => "1").should == {:path =>"/predicates/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "predicates", :action => "destroy", :id => "1").should == {:path =>"/predicates/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/predicates").should == {:controller => "predicates", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/predicates/new").should == {:controller => "predicates", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/predicates").should == {:controller => "predicates", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/predicates/1").should == {:controller => "predicates", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/predicates/1/edit").should == {:controller => "predicates", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/predicates/1").should == {:controller => "predicates", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/predicates/1").should == {:controller => "predicates", :action => "destroy", :id => "1"}
    end
  end
end
