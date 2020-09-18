class AddStatusToTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :teacher_courses, :status, :string
  end
end
