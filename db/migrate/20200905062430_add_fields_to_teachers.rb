class AddFieldsToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :email, :string
    add_column :teachers, :address, :text
  end
end
