class AddFieldsToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :sid, :integer
    add_column :payments, :cname, :string
    add_column :payments, :cnumber, :integer, length: {minimum: 16, maximum: 16}
    add_column :payments, :expMonth, :integer,length: {minimum: 2, maximum: 2}
    add_column :payments, :expYr, :integer, length: {minimum: 2, maximum: 2}
    add_column :payments, :cvv, :integer, length: {minimum: 3, maximum: 3}
  end
end
