class Expense < ActiveRecord::Base
  has_many :purchases
  has_many :balances
  
  validates_presence_of :name
  validates_presence_of :budget
end
