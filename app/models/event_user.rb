class EventUser < ActiveRecord::Base


	belongs_to :event, counter_cache: true
  belongs_to :user , :foreign_key => "user_id"



  accepts_nested_attributes_for :user
end