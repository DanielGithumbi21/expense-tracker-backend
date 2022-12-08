class SpendingsController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    
    def create
        spending = Spending.create!(spendings_params)
        render json: spending,  status: :created
    end

    def index
        spendings = Spending.all
        render json: spendings, include: :user
      end
    def get_users
        user = User.find(params[:id])
        spendings = user.spending
        render json: spendings
    end
    private
    def spendings_params
        params.permit(:income, :budget,:user_id)
      end

  def render_unprocessable_entity_response(invalid)
    render json: { errors: invalid.record.errors }, status: :unprocessable_entity
  end
end