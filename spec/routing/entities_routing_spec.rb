require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe EntitiesController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "entities", :action => "index").should == "/entities"
    end
  
    it "maps #new" do
      route_for(:controller => "entities", :action => "new").should == "/entities/new"
    end
  
    it "maps #show" do
      route_for(:controller => "entities", :action => "show", :id => "1").should == "/entities/1"
    end
  
    it "maps #edit" do
      route_for(:controller => "entities", :action => "edit", :id => "1").should == "/entities/1/edit"
    end

  it "maps #create" do
    route_for(:controller => "entities", :action => "create").should == {:path => "/entities", :method => :post}
  end

  it "maps #update" do
    route_for(:controller => "entities", :action => "update", :id => "1").should == {:path =>"/entities/1", :method => :put}
  end
  
    it "maps #destroy" do
      route_for(:controller => "entities", :action => "destroy", :id => "1").should == {:path =>"/entities/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/entities").should == {:controller => "entities", :action => "index"}
    end
  
    it "generates params for #new" do
      params_from(:get, "/entities/new").should == {:controller => "entities", :action => "new"}
    end
  
    it "generates params for #create" do
      params_from(:post, "/entities").should == {:controller => "entities", :action => "create"}
    end
  
    it "generates params for #show" do
      params_from(:get, "/entities/1").should == {:controller => "entities", :action => "show", :id => "1"}
    end
  
    it "generates params for #edit" do
      params_from(:get, "/entities/1/edit").should == {:controller => "entities", :action => "edit", :id => "1"}
    end
  
    it "generates params for #update" do
      params_from(:put, "/entities/1").should == {:controller => "entities", :action => "update", :id => "1"}
    end
  
    it "generates params for #destroy" do
      params_from(:delete, "/entities/1").should == {:controller => "entities", :action => "destroy", :id => "1"}
    end
  end
end
