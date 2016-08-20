class Event < ActiveRecord::Base

  validates :name, presence: true
  validates_numericality_of :amount, :greater_than => 0

  validate :check_payments

  has_many :payments, as: :object
  accepts_nested_attributes_for :payments


  def check_payments
  	total_payments = self.payments.inject(0){|sum, payment| sum += payment.amount}
  	errors.add("Payments amount should match event amount") if total_payments != self.amount
  end

end
