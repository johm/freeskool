class CreateCourseSessions < ActiveRecord::Migration
  def change
    create_table :course_sessions do |t|
      t.references :course
      t.datetime :course_session_start
      t.datetime :course_session_end
      t.text :description
      t.references :location

      t.timestamps
    end
    add_index :course_sessions, :course_id
    add_index :course_sessions, :location_id
  end
end
