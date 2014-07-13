class Balances < ActiveRecord::Migration
  def self.up
    create_table :balances do |t|
      t.column :expense_id,   :integer
      t.column :period_id,    :integer
      t.column :balance,      :float
      t.column :budget,       :float
    end
  end

  def self.down
    drop_table :balances
  end
end
