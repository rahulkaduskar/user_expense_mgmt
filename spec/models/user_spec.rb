require 'rails_helper'
require 'spec_helper'


RSpec.describe User, type: :model do
  before :each do
    @user = create(:user)
  end

  it "should be valid with a name and email" do
    expect(@user).to be_valid 
  end

  it "should not be valid without a name" do
    @user.name = nil
    expect(@user).not_to be_valid 
    expect(@user.errors[:name]).to include("can't be blank")
  end

  it "should not be valid without valid email" do
    @user.email = "dfdsf"
    expect(@user).not_to be_valid 
    expect(@user.errors[:email]).to include("is invalid")
  end
end