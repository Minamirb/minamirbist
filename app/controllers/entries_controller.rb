class EntriesController < ApplicationController
  private
  before_filter :only => [:new, :create] do |controller|
    @entry = Entry.new(params[:entry])
    unless params[:event_id].blank? 
      @entry.event_id = params[:event_id]
      @event = @entry.event
    end
    @members = Member.all
  end

  public
  # GET /entries
  # GET /entries.xml
  def index
    @entries = Entry.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @entries }
    end
  end

  # GET /entries/1
  # GET /entries/1.xml
  def show
    @entry = Entry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/new
  # GET /entries/new.xml
  def new
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @entry }
    end
  end

  # GET /entries/1/edit
  def edit
    @entry = Entry.find(params[:id])
    @event = Event.find(params[:event_id])
    @members = Member.find(:all)
  end

  # POST /entries
  # POST /entries.xml
  def create
    @entry.member_id = params[:entry][:member_id]
    respond_to do |format|
      if @entry.save
        format.html { redirect_to(@entry.event, :notice => 'Entry was successfully created.') }
        format.xml  { render :xml => @entry, :status => :created, :location => @entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /entries/1
  # PUT /entries/1.xml
  def update
    @entry = Entry.find(params[:id])

    respond_to do |format|
      if @entry.update_attributes(params[:entry])
        format.html { redirect_to(@entry, :notice => 'Entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.xml
  def destroy
    @entry = Entry.find(params[:id])
    @entry.destroy
    respond_to do |format|
      # TODO もう少し格好良くしたい
      format.html { redirect_to params[:event_id].blank? ? member_path(params[:member_id]) : event_path(params[:event_id]) }
      format.xml  { head :ok }
    end
  end
end
