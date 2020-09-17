class AddFieldsToFeedback < ActiveRecord::Migration[6.0]
  def change
    add_column :feedbacks, :teacherid, :integer
    add_column :feedbacks, :courseid, :integer
    add_column :feedbacks, :ftext, :string
  end
end
