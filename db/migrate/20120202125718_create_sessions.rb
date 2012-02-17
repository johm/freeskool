class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :course
      t.datetime :session_start
      t.datetime :session_end
      t.text :description
      t.references :location

      t.timestamps
    end
    add_index :sessions, :course_id
    add_index :sessions, :location_id
  end
end
