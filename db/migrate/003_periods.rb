class Periods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.column :start_date,     :date
      t.column :end_date,       :date
      t.column :position,       :integer
    end
  end

  def self.down
    drop_table :periods
  end
end
