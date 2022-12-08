class ExpensesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def create
    expense = Expense.create!(expense_params)
        render json: expense,  status: :created
    end

    def show
      expense = Expense.find_by(id: params[:id])
          if expense
            render json: expense
          else
            render json: { error: "expense not found" }, status: :not_found
          end
        end
        def update
          expense = Expense.find_by(id: params[:id])
          if expense
            expense.update(expense_params)
            render json: expense
          else
            render json: { error: "Expense not found" }, status: :not_found
          end
        end
        def destroy
          expense = Expense.find_by(id: params[:id])
          if expense
            expense.destroy
            head :no_content
          else
            render json: { error: "Expense not found" }, status: :not_found
          end
        end

    def get_expenses
        user = User.find(params[:id])
        expenses = user.expenses
        render json: expenses
    end
    private
    def expense_params
        params.permit(:name, :txdate, :description, :amount, :user_id)
      end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
