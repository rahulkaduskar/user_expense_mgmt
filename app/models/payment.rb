class Payment < ActiveRecord::Base

	belongs_to :object, :polymorphic => true

	belongs_to :user

	belongs_to :events, :foreign_key => :object_id, :class_name => "Event"

  scope :events, lambda { |user_id|
    joins("JOIN events ON events.id = payments.object_id AND payments.object_type = 'Event'").
    joins("JOIN event_users ON event_users.event_id = events.id").
    select("event_users.user_id as user_id, sum(payments.amount/events.event_users_count) as amount").
    where(["event_users.user_id != ?", user_id]).
    group("event_users.user_id")
  }


	scope :total_expense, lambda { |user_id|
    select("(payments.amount ) as expense, event_users.user_id ").
    joins("INNER JOIN events on events.id = payments.object_id").
    joins("INNER JOIN event_users on event_users.event_id = events.id").
    where(["event_users.user_id = ?  and payments.object_type='Event' and event_users.user_id != ?", user_id, user_id])
   
  }
end