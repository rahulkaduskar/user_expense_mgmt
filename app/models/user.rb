class User < ActiveRecord::Base

  validates :name, presence: true 
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :event_users
  has_many :events, through: :event_users 

  has_many :payments, as: :object

  has_many :expenses, class_name: "Payment"

  accepts_nested_attributes_for :event_users

end
