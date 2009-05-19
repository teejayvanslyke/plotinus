require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe PredicatesController do

  def mock_predicate(stubs={})
    @mock_predicate ||= mock_model(Predicate, stubs)
  end
  
  describe "GET index" do
    it "assigns all predicates as @predicates" do
      Predicate.stub!(:find).with(:all).and_return([mock_predicate])
      get :index
      assigns[:predicates].should == [mock_predicate]
    end
  end

  describe "GET show" do
    it "assigns the requested predicate as @predicate" do
      Predicate.stub!(:find).with("37").and_return(mock_predicate)
      get :show, :id => "37"
      assigns[:predicate].should equal(mock_predicate)
    end
  end

  describe "GET new" do
    it "assigns a new predicate as @predicate" do
      Predicate.stub!(:new).and_return(mock_predicate)
      get :new
      assigns[:predicate].should equal(mock_predicate)
    end
  end

  describe "GET edit" do
    it "assigns the requested predicate as @predicate" do
      Predicate.stub!(:find).with("37").and_return(mock_predicate)
      get :edit, :id => "37"
      assigns[:predicate].should equal(mock_predicate)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created predicate as @predicate" do
        Predicate.stub!(:new).with({'these' => 'params'}).and_return(mock_predicate(:save => true))
        post :create, :predicate => {:these => 'params'}
        assigns[:predicate].should equal(mock_predicate)
      end

      it "redirects to the created predicate" do
        Predicate.stub!(:new).and_return(mock_predicate(:save => true))
        post :create, :predicate => {}
        response.should redirect_to(predicate_url(mock_predicate))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved predicate as @predicate" do
        Predicate.stub!(:new).with({'these' => 'params'}).and_return(mock_predicate(:save => false))
        post :create, :predicate => {:these => 'params'}
        assigns[:predicate].should equal(mock_predicate)
      end

      it "re-renders the 'new' template" do
        Predicate.stub!(:new).and_return(mock_predicate(:save => false))
        post :create, :predicate => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested predicate" do
        Predicate.should_receive(:find).with("37").and_return(mock_predicate)
        mock_predicate.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :predicate => {:these => 'params'}
      end

      it "assigns the requested predicate as @predicate" do
        Predicate.stub!(:find).and_return(mock_predicate(:update_attributes => true))
        put :update, :id => "1"
        assigns[:predicate].should equal(mock_predicate)
      end

      it "redirects to the predicate" do
        Predicate.stub!(:find).and_return(mock_predicate(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(predicate_url(mock_predicate))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested predicate" do
        Predicate.should_receive(:find).with("37").and_return(mock_predicate)
        mock_predicate.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :predicate => {:these => 'params'}
      end

      it "assigns the predicate as @predicate" do
        Predicate.stub!(:find).and_return(mock_predicate(:update_attributes => false))
        put :update, :id => "1"
        assigns[:predicate].should equal(mock_predicate)
      end

      it "re-renders the 'edit' template" do
        Predicate.stub!(:find).and_return(mock_predicate(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested predicate" do
      Predicate.should_receive(:find).with("37").and_return(mock_predicate)
      mock_predicate.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the predicates list" do
      Predicate.stub!(:find).and_return(mock_predicate(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(predicates_url)
    end
  end

end
