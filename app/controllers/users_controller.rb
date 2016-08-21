class UsersController < ApplicationController

  before_action :set_user, only: [:show]

  before_action :redirect_home, only: [:show]
  
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_user_path, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  def show
    @users = Payment.joins("inner join users on users")
    @total_expenses = Payment.total_expense(@user.id).first.try("total_expenses") || 0
    @total_paid = Payment.select("sum(amount) as total_paid").where(["user_id =?", @user.id]).first.try("total_paid" )|| 0
    @user_balance = Payment.joins(:user).events
  end

  def search
    query = "#{ params[:query]}%"
    users = User.where(["name like ? or email like ?", query, query ])
    respond_to do |format|
      format.json { render json: users }
    end
  end



  private

  def set_user
    @user = User.where(["id = ?", params[:id] ]).first
  end

  def redirect_home
    if @user.blank?
      flash[:error] = " User not found"
      redirect_to "/" 
    end
  end

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
