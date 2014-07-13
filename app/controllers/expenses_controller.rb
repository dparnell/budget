class ExpensesController < ApplicationController
  respond_to :xml, :json, :html

  def index
    @expenses = Expense.all

    respond_with @expenses
  end

  def show
    @expense = Expense.find(params[:id])
    respond_with @expense
  end

  def new
    @expense = Expense.new
    respond_with @expense
  end

  def create
    @expense = Expense.new(params[:expense])
    if @expense.save
      flash[:notice] = 'Expense was successfully created.'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @expense = Expense.find(params[:id])
    respond_with @expense
  end

  def update
    @expense = Expense.find(params[:id])
    if @expense.update_attributes(params[:expense])
      flash[:notice] = 'Expense was successfully updated.'
      redirect_to :action => 'show', :id => @expense
    else
      render :action => 'edit'
    end
  end

  def destroy
    Expense.find(params[:id]).destroy
    redirect_to :action => 'list'
  end
end
