class AddUserToCourses < ActiveRecord::Migration
  def change
    change_table :courses do |t|
      t.references :user
    end
    add_index :courses,:user_id
  end
end
