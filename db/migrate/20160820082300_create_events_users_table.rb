class CreateEventsUsersTable < ActiveRecord::Migration
  def change
    create_table :events_users do |t|
    	t.integer :event_i, :null => false
    	t.integer :user_id, :null => false
    	t.timestamps
    end
  end
end
