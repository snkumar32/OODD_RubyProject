class AddFieldsToCourses < ActiveRecord::Migration[6.0]
  def change
    add_column :courses, :name, :string
    add_column :courses, :number, :integer
    add_column :courses, :discipline, :string
    add_column :courses, :area, :string
    add_column :courses, :price, :float
  end
end
