class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
    
    create_table :roles_users, :id => false do |t|
      t.integer :role_id, :null => false
      t.integer :user_id, :null => false
    end
    
    #this didn't work with sqlite3
    #add_index(:roles_users, [:role_id, :user_id], :unique => true)
  end

  def self.down
    drop_table :roles
    drop_table :roles_users
  end
end
