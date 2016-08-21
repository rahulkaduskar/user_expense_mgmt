require 'rails_helper'
require 'spec_helper'
require 'pry'

RSpec.describe Event, type: :model do
  before :each do
    @event = create(:event)
  end

  it "should be valid with a name and email" do
    expect(@event).to be_valid 
  end

  it "should not be valid without a name" do
    @event.name = nil
    expect(@event).not_to be_valid 

    expect(@event.errors[:name]).to include("can't be blank")
  end

  it "should not be valid without valid email" do
  	@event.name = "event 1"
    @event.amount = nil
    expect(@event).not_to be_valid 
    expect(@event.errors[:amount]).to include("is not a number")
  end

  it "should not be valid without valid email" do
  	@event.name = "event 1"
    @event.amount = -1
    expect(@event).not_to be_valid 
    expect(@event.errors[:amount]).to include("must be greater than 0")
  end
end
