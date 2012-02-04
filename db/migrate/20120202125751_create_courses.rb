class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :short_description
      t.text :long_description
      t.boolean :is_approved

      t.timestamps
    end
  end
end
