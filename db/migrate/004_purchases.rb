class Purchases < ActiveRecord::Migration
  def self.up
    create_table :purchases do |t|
      t.column :entered_by,       :string
      t.column :expense_id,       :integer
      t.column :description,      :string
      t.column :amount,           :float
      t.column :purchase_date,    :date
      t.column :period_id,        :integer
    end
  end

  def self.down
    drop_table :purchases
  end
end
