class CreateSignups < ActiveRecord::Migration
  def change
    create_table :signups do |t|
      t.references :course
      t.references :user

      t.timestamps
    end
    add_index :signups, :course_id
    add_index :signups, :user_id
  end
end
