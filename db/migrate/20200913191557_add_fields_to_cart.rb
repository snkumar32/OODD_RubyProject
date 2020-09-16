class AddFieldsToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :courseid, :integer
    add_column :carts, :teacherid, :integer
    add_column :carts, :studentid, :integer
  end
end
