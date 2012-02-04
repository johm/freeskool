class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.references :course
      t.date :session_date
      t.time :session_start
      t.time :session_end
      t.text :description
      t.references :location

      t.timestamps
    end
    add_index :sessions, :course_id
    add_index :sessions, :location_id
  end
end
