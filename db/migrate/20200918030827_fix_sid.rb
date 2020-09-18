class FixSid < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :sid, :studentid
  end
end
