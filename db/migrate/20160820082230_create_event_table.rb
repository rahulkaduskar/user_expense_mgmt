class CreateEventTable < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :name, :null => false
    	t.float :amount, :default => false
    	t.timestamps
    end
  end
end
