class CreateTeacherCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :teacher_courses do |t|

      t.timestamps
    end
  end
end
