class EventsController < ApplicationController
  
  def index
    @events = Event.all
  end


  def new
    @event = Event.new
    @event.payments.build
  end

  def create
    binding.pry
    @event = Event.new(event_params)
     binding.pry
    if @event.save
       redirect_to @event, notice: 'Event was successfully created.' 
    else
      render :new
    end
  end


  def show
    @event = Event.where(["id = ?", params[:id]]).first
  end
  private
    
    def event_params
      params.require(:event).permit(:name, :amount, :payments_attributes => [:user_id, :amount])
    end
end
