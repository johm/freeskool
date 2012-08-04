class AddIsPrivateToCourse < ActiveRecord::Migration
  def change
        add_column :courses, :is_private, :boolean
  end
end
