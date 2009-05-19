require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TriplesController do

  def mock_triple(stubs={})
    @mock_triple ||= mock_model(Triple, stubs)
  end
  
  describe "GET index" do
    it "assigns all triples as @triples" do
      Triple.stub!(:find).with(:all).and_return([mock_triple])
      get :index
      assigns[:triples].should == [mock_triple]
    end
  end

  describe "GET show" do
    it "assigns the requested triple as @triple" do
      Triple.stub!(:find).with("37").and_return(mock_triple)
      get :show, :id => "37"
      assigns[:triple].should equal(mock_triple)
    end
  end

  describe "GET new" do
    it "assigns a new triple as @triple" do
      Triple.stub!(:new).and_return(mock_triple)
      get :new
      assigns[:triple].should equal(mock_triple)
    end
  end

  describe "GET edit" do
    it "assigns the requested triple as @triple" do
      Triple.stub!(:find).with("37").and_return(mock_triple)
      get :edit, :id => "37"
      assigns[:triple].should equal(mock_triple)
    end
  end

  describe "POST create" do
    
    describe "with valid params" do
      it "assigns a newly created triple as @triple" do
        Triple.stub!(:new).with({'these' => 'params'}).and_return(mock_triple(:save => true))
        post :create, :triple => {:these => 'params'}
        assigns[:triple].should equal(mock_triple)
      end

      it "redirects to the created triple" do
        Triple.stub!(:new).and_return(mock_triple(:save => true))
        post :create, :triple => {}
        response.should redirect_to(triple_url(mock_triple))
      end
    end
    
    describe "with invalid params" do
      it "assigns a newly created but unsaved triple as @triple" do
        Triple.stub!(:new).with({'these' => 'params'}).and_return(mock_triple(:save => false))
        post :create, :triple => {:these => 'params'}
        assigns[:triple].should equal(mock_triple)
      end

      it "re-renders the 'new' template" do
        Triple.stub!(:new).and_return(mock_triple(:save => false))
        post :create, :triple => {}
        response.should render_template('new')
      end
    end
    
  end

  describe "PUT update" do
    
    describe "with valid params" do
      it "updates the requested triple" do
        Triple.should_receive(:find).with("37").and_return(mock_triple)
        mock_triple.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :triple => {:these => 'params'}
      end

      it "assigns the requested triple as @triple" do
        Triple.stub!(:find).and_return(mock_triple(:update_attributes => true))
        put :update, :id => "1"
        assigns[:triple].should equal(mock_triple)
      end

      it "redirects to the triple" do
        Triple.stub!(:find).and_return(mock_triple(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(triple_url(mock_triple))
      end
    end
    
    describe "with invalid params" do
      it "updates the requested triple" do
        Triple.should_receive(:find).with("37").and_return(mock_triple)
        mock_triple.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :triple => {:these => 'params'}
      end

      it "assigns the triple as @triple" do
        Triple.stub!(:find).and_return(mock_triple(:update_attributes => false))
        put :update, :id => "1"
        assigns[:triple].should equal(mock_triple)
      end

      it "re-renders the 'edit' template" do
        Triple.stub!(:find).and_return(mock_triple(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end
    
  end

  describe "DELETE destroy" do
    it "destroys the requested triple" do
      Triple.should_receive(:find).with("37").and_return(mock_triple)
      mock_triple.should_receive(:destroy)
      delete :destroy, :id => "37"
    end
  
    it "redirects to the triples list" do
      Triple.stub!(:find).and_return(mock_triple(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(triples_url)
    end
  end

end
