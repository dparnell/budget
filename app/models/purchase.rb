class Purchase < ActiveRecord::Base
  belongs_to :expense
  belongs_to :period

  before_save :set_period_and_balance
  before_destroy :update_balance

  validates_presence_of :entered_by
  validates_presence_of :description
  validates_presence_of :amount
  validates_presence_of :purchase_date
  validates_numericality_of :amount

  def set_period_and_balance
    if not new_record?
      # this should never happen
      raise "Purchases may not be altered"
    end

    transaction do
      # find the period
      p = Period.periodForDate(self.purchase_date)
      self.period = p

      # update the balance for the period
      b = period.balances.where(:expense_id => expense.id).first
      if b
        b.balance = b.balance - self.amount
        b.save
      end
    end

    true
  end

  def update_balance
    transaction do
      # update the balance for the period
      b = period.balances.where(:expense_id => expense.id).first
      if b
        b.balance = b.balance + self.amount
        b.save
      end
    end

    true
  end

end
