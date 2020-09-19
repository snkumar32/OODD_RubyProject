class AddFieldsToTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :teacher_courses, :teacherid, :string
    add_column :teacher_courses, :courseid, :string
  end
end
