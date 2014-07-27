class AddCourseToSwimmerTimes < ActiveRecord::Migration
  def change
    add_column :swimmer_times, :course, :string
  end
end
