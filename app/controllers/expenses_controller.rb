class ExpensesController < ApplicationController
  def index
     #@expenses = Expense.order("date DESC")
     if params[:concept]
       @expenses = Expense.where('concept LIKE ? AND category_id LIKE ?', "%#{params[:concept].downcase}", "%#{params[:category_id]}")
     else
       @expenses = Expense.all
     end
  end
end
