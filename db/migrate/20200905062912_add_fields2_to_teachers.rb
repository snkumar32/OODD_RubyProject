class AddFields2ToTeachers < ActiveRecord::Migration[6.0]
  def change
    add_column :teachers, :discipline, :string
    add_column :teachers, :phone, :string
  end
end
