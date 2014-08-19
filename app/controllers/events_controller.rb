class EventsController < ApplicationController
  before_action CASClient::Frameworks::Rails::Filter, only: [:new, :edit]
  before_action :set_event, only: [:show, :edit, :update, :destroy, :signup]
  layout 'show', only: :show

  # GET /events
  def index
    @events = Event.all
    @new = new_event_path(@event) if can? :create, Event
  end

  # GET /events/1
  def show
    @edit = edit_event_path(@event) if can? :edit, @event
    @new = new_event_path(@event) if can? :create, Event
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def signup
    if current_user.nil? || current_user.id.nil?
      @event.add_email(params[:email])
      # guest user
    else
      # reg user
      @event.climbers << current_user
      @event.save
    end
    flash[:notice] = 'Signed up!'

    redirect_to @event
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.required(:event).permit(:name, :description, :start_date, :end_date, :signup, :cover, :private, :public_signup)
    end
end
