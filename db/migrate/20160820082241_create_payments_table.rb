class CreatePaymentsTable < ActiveRecord::Migration
  def change
    create_table :payments do |t|
    	t.float :amount , :null => false
    	t.integer :user_id, :null => false
    	t.string :object_type, :null => false
    	t.string :object_id, :null => false
    	t.timestamps
    end
  end
end
