class CreateStudentCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :student_courses do |t|

      t.timestamps
    end
  end
end
