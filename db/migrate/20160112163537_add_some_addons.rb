class AddSomeAddons < ActiveRecord::Migration
  def up
  	add_column :articles, :description, :text
  	add_column :articles, :created_at, :datetime
  	add_column :articles, :updated_at, :datetime
    add_column :articles, :owner, :string
  end

  def down

  	remove_column :articles, :owner, :string
    remove_column :articles, :updated_at, :datetime
  	remove_column :articles, :created_at, :datetime
  	remove_column :articles, :description, :text
  	
  end
end
