class Period < ActiveRecord::Base
  acts_as_list
  has_many :purchases
  has_many :balances
  
  def self.currentPeriod
    self.periodForDate(Date.today)
  end
  
  def self.periodForDate(theDate, create = true)
    p = Period.where("(start_date <= ?) and (end_date > ?)", theDate, theDate).first
    
    if !p and create
      last = Period.order("id desc").first
      if last
        if theDate<last.end_date
          raise "Can not add a new period before the current/last period #{theDate} < #{last.end_date}"
        end
      end

      day = theDate.wday
      week_start = theDate - day
      week_end = week_start + 7
      
      logger.info("#{Time.now}\tCreating new period starting at: #{week_start.to_s}")

      transaction do 
        p = Period.create(:start_date => week_start, :end_date => week_end)
      
        xs = Expense.all
        for x in xs
          old = Balance.where(:expense_id => x.id).order("id desc").first
        
          if old
            current = old.balance
          else
            current = 0
          end
        
          current = current + x.budget
        
          Balance.create(:expense => x, :period => p, :balance => current, :budget => x.budget)
        end
      end
    end
    
    return p
  end
end
