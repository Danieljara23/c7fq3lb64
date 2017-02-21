class ExpensesController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
     #@expenses = Expense.order("date DESC")
     if params[:concept]
       @expenses = current_user.expenses.where('concept LIKE ? AND category_id LIKE ?', "%#{params[:concept].downcase}", "%#{params[:category_id]}")
     else
       @expenses = current_user.expenses.all
     end
  end
end
