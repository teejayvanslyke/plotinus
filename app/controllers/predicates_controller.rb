class PredicatesController < ApplicationController
  # GET /predicates
  # GET /predicates.xml
  def index
    @predicates = Predicate.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @predicates }
    end
  end

  # GET /predicates/1
  # GET /predicates/1.xml
  def show
    @predicate = Predicate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @predicate }
    end
  end

  # GET /predicates/new
  # GET /predicates/new.xml
  def new
    @predicate = Predicate.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @predicate }
    end
  end

  # GET /predicates/1/edit
  def edit
    @predicate = Predicate.find(params[:id])
  end

  # POST /predicates
  # POST /predicates.xml
  def create
    @predicate = Predicate.new(params[:predicate])

    respond_to do |format|
      if @predicate.save
        flash[:notice] = 'Predicate was successfully created.'
        format.html { redirect_to(@predicate) }
        format.xml  { render :xml => @predicate, :status => :created, :location => @predicate }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @predicate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /predicates/1
  # PUT /predicates/1.xml
  def update
    @predicate = Predicate.find(params[:id])

    respond_to do |format|
      if @predicate.update_attributes(params[:predicate])
        flash[:notice] = 'Predicate was successfully updated.'
        format.html { redirect_to(@predicate) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @predicate.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /predicates/1
  # DELETE /predicates/1.xml
  def destroy
    @predicate = Predicate.find(params[:id])
    @predicate.destroy

    respond_to do |format|
      format.html { redirect_to(predicates_url) }
      format.xml  { head :ok }
    end
  end
end
