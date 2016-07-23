class Api::V1::UsersController < Api::V1::BaseController
  def show
    render json: current_api_v1_user, serializer: Api::V1::UserSerializer
  end

  def update
    user = current_api_v1_user
    if user.update(permit_user_params)
      render json: user, serializer: Api::V1::UserSerializer
    else
      render json: user.errors, status: :unprocessable_entity 
    end
  end

  private
    def permit_user_params
      params.delete(:password) if params[:password].blank?
      params.permit([:username, :first_name, :second_name, :f_last_name, 
        :s_last_name, :sex, :curp, :rfc, :mobile, :phone, :password])
    end
end
