class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
    	t.string :owner_id
    	t.text :description
    end
  end

  def down
  	drop_table :comments
  	
  end
end
