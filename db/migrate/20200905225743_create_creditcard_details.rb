class CreateCreditcardDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :creditcard_details do |t|
      t.integer :cid
      t.integer :SID
      t.string :Name
      t.string :CardNumber
      t.integer :expMonth
      t.integer :expYear
      t.integer :cvv

      t.timestamps
    end
  end
end
