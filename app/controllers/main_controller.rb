class MainController < ApplicationController
	layout "main"
  layout false, :only => [:auto_complete_for_purchase_entered_by, :auto_complete_for_purchase_description, :balance_details, :delete_purchase]

  def index
    if params[:id]
      @period = Period.find(params[:id])
    else
      @period = Period.currentPeriod
    end

    @balances = @period.balances
  end

  def new_purchase
    @purchase = Purchase.new(params.require(:purchase).permit(:entered_by, :description, :amount, :purchase_date, :expense_id))
    if @purchase.save
      flash[:notice] = 'Purchase was successfully entered.'
      @balance = Period.currentPeriod.balances.where(:expense_id => @purchase.expense.id).first
    else
      @balance = nil
      flash[:notice] = ''
    end

    redirect_to '/'
  end

  def balance_details
    @balance = Balance.find(params[:id])
    @period = @balance.period
    @purchases = @period.purchases.where(:expense_id => @balance.expense.id).all
  end

  def delete_purchase
    @purchase = Purchase.find(params[:id])
    period = @purchase.period
    @purchase.destroy

    @balance = Balance.where(:period_id => period.id, :expense_id => @purchase.expense.id).first

    redirect_to '/'
  end

  def auto_complete_for_purchase_entered_by
    @items = Purchase.find_by_sql ["select distinct entered_by value from purchases where lower(entered_by) like ? order by entered_by", '%'+params[:term]+'%']

    render :json => @items
  end

  def auto_complete_for_purchase_description
    @items = Purchase.find_by_sql ["select distinct description value from purchases where lower(description) like ? order by description", '%'+params[:term]+'%']

		render :json => @items
  end

end
