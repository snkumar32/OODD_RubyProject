class AddFieldsToCourseRegistration < ActiveRecord::Migration[6.0]
  def change
    add_column :course_registrations, :teacherid, :integer
    add_column :course_registrations, :courseid, :integer
    add_column :course_registrations, :studentid, :integer
    add_column :course_registrations, :price, :float
    add_column :course_registrations, :type, :string
  end
end
