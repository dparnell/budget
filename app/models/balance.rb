class Balance < ActiveRecord::Base
  belongs_to :expense
  belongs_to :period
end
