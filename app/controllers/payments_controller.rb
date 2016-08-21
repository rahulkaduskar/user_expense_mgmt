class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :edit, :update, :destroy]


  def index
    @payments = Payment.all
  end


end
