class Expenses < ActiveRecord::Migration
  def self.up
    create_table :expenses do |t|
      t.column :name,         :string
      t.column :budget,       :float
    end
  end

  def self.down
    drop_table :expenses
  end
end
