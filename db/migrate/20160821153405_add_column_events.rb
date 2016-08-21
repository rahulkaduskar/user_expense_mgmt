class AddColumnEvents < ActiveRecord::Migration
  def change
  	add_column :events, :event_users_count, :integer  
  end
end
