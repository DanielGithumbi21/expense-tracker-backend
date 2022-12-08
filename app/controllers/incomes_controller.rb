class IncomesController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    def create
    income = Income.create!(income_params)
        render json: income,  status: :created
    end

    def show
    income = Income.find_by(id: params[:id])
        if income
          render json: income
        else
          render json: { error: "income not found" }, status: :not_found
        end
      end
      def update
        income = Income.find_by(id: params[:id])
        if income
          income.update(income_params)
          render json: income
        else
          render json: { error: "Income not found" }, status: :not_found
        end
      end

      def destroy
        income = Income.find_by(id: params[:id])
        if income
          income.destroy
          head :no_content
        else
          render json: { error: "Income not found" }, status: :not_found
        end
      end

    def get_incomes
        user = User.find(params[:id])
    incomes = user.income
        render json: incomes
    end
    private
    def income_params
        params.permit(:name, :txdate, :description, :amount, :user_id)
      end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end
