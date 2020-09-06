class AddFieldsToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :name, :string
    add_column :students, :email, :string
    add_column :students, :address, :string
    add_column :students, :phone, :string
    add_column :students, :major, :string
  end
end
