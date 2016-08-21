class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end


  def new
    @event = Event.new
  end

  def create   
    @event = Event.new(event_params)
    if @event.save
       redirect_to @event, notice: 'Event was successfully created.' 
    else
      render :new
    end
  end


  def show
    @event = Event.where(["id = ?", params[:id]]).first
  end

  def add_user
    @event = Event.new
    @event_users = @event.event_users.build 
    render layout: false
  end

  def add_payment
    @event = Event.new
    @payments = @event.payments.new
    render layout: false
  end

  private
    
    def event_params
      params.require(:event).permit(:name, :amount, event_users_attributes:[:user_id], payments_attributes: [:user_id, :amount])
    end
end
