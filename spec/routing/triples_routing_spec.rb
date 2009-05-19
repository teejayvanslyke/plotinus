require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TriplesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "triples", :action => "index").should == "/triples"
    end
  
    it "maps #new" do
      route_for(:controller => "triples", :action => "new").should == "/triples/new"
    end
  
    it "maps #show" do
      route_for(:controller => "triples", :action => "show", :id => "1").should == "/triples/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "triples", :action => "edit", :id => "1").should == "/triples/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "triples", :action => "create").should == {:path => "/triples", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "triples", :action => "update", :id => "1").should == {:path =>"/triples/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "triples", :action => "destroy", :id => "1").should == {:path =>"/triples/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/triples").should == {:controller => "triples", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/triples/new").should == {:controller => "triples", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/triples").should == {:controller => "triples", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/triples/1").should == {:controller => "triples", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/triples/1/edit").should == {:controller => "triples", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/triples/1").should == {:controller => "triples", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/triples/1").should == {:controller => "triples", :action => "destroy", :id => "1"}
    end
  end
end
