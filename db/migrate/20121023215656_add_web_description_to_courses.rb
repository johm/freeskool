class AddWebDescriptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :print_description, :text
  end
end
