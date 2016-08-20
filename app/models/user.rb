class User < ActiveRecord::Base

  validates :name, presence: true 
  validates :email, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

end
