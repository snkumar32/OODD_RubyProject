class ChangeTypeToStatus < ActiveRecord::Migration[6.0]
  def change
    rename_column :course_registrations, :type, :status
  end
end
