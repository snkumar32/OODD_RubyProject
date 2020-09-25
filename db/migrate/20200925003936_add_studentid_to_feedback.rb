class AddStudentidToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :studentid, :integer
  end
end
