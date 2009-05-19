class TriplesController < ApplicationController
  # GET /triples
  # GET /triples.xml
  def index
    @triples = Triple.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @triples }
    end
  end

  def search
    @triples = Triple.search(:conditions => params[:triple])

    json = @triples.map do |triple|
      { 'triple' => {
        'url'             => triple_url(triple),
        'subject'         => triple.subject_name,
        'subject_url'     => entity_url(:id => triple.subject.permalink),
        'object'          => triple.object_name,
        'object_url'      => entity_url(:id => triple.object.permalink),
        'predicate_name'  => triple.predicate_name,
        'to_sentence'     => triple.to_sentence
      }}
    end
    
    respond_to do |format|
      format.json { render :json => json }
    end
  end

  # GET /triples/1
  # GET /triples/1.xml
  def show
    @triple = Triple.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @triple }
    end
  end

  # GET /triples/new
  # GET /triples/new.xml
  def new
    @triple = Triple.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @triple }
    end
  end

  # GET /triples/1/edit
  def edit
    @triple = Triple.find(params[:id])
  end

  # POST /triples
  # POST /triples.xml
  def create
    @triple = Triple.new(params[:triple])

    respond_to do |format|
      if @triple.save
        format.json { render :text => @triple.to_sentence }
      else
        format.json { render :text => 'Oops!  There was a problem submitting your triple.' }
      end
    end
  end

  # PUT /triples/1
  # PUT /triples/1.xml
  def update
    @triple = Triple.find(params[:id])

    respond_to do |format|
      if @triple.update_attributes(params[:triple])
        flash[:notice] = 'Triple was successfully updated.'
        format.html { redirect_to(@triple) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @triple.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /triples/1
  # DELETE /triples/1.xml
  def destroy
    @triple = Triple.find(params[:id])
    @triple.destroy

    respond_to do |format|
      format.html { redirect_to(triples_url) }
      format.xml  { head :ok }
    end
  end
end
