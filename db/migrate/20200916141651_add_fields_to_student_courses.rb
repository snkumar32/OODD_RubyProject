class AddFieldsToStudentCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :student_courses, :teacherid, :integer
    add_column :student_courses, :studentid, :integer
    add_column :student_courses, :courseid, :integer
  end
end
