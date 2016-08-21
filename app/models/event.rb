class Event < ActiveRecord::Base

  validates :name, presence: true
  validates_numericality_of :amount, :greater_than => 0

  # validate :check_payments_users

  has_many :event_users, inverse_of: :event

  has_many :users, through: :event_users, :foreign_key => "user_id" 

  has_many :payments, as: :object
  accepts_nested_attributes_for :payments
  accepts_nested_attributes_for :event_users
  accepts_nested_attributes_for :users


  def check_payments_users
  	errors.add(:event_users, "Please at least add one user")  if self.event_users.blank?
  	if self.payments.present?	  	
	  	total_payments = self.payments.inject(0){|sum, payment| sum += payment.amount}
	  	errors.add("Payments amount should match event amount") if total_payments != self.amount
	  else
	  	errors.add(:payments, "amount should match event amount") 
	  end
  end

end
