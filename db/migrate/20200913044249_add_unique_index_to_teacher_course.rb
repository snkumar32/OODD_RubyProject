class AddUniqueIndexToTeacherCourse < ActiveRecord::Migration[6.0]
  def change
    add_index :teacher_courses, [:teacherid, :courseid], unique: true
  end
end
