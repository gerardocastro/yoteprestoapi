class Api::V1::ApplicationsController < Api::V1::BaseController
  def index
    applications = current_api_v1_user.applications.includes(:expenses, :references)
    render json: applications, each_serializer: Api::V1::ApplicationSerializer
  end

  def create
    application = current_api_v1_user.applications.build(permit_application_params)
    if application.save()
      render json: application, serializer: Api::V1::ApplicationSerializer
    else
      render json: application.errors, status: :unprocessable_entity 
    end
  end

  def show
    application = current_api_v1_user.applications.find(params[:id])
    render json: application, serializer: Api::V1::ApplicationSerializer
  end

  def update
    application = current_api_v1_user.applications.find(params[:id])
    if application.update(permit_application_params)
      render json: application, serializer: Api::V1::ApplicationSerializer
    else
      render json: application.errors, status: :unprocessable_entity 
    end
  end

  def permit_application_params
    params.require(:application).permit(:id, :loan_title, :loan_detail, :loan_destination, :funding_days, 
        :has_credit_card, :has_insurance, :has_car, :other_income, :education,
        :pay_job, :year_job, :company_job,
        expenses_attributes: [:id, :expense_type, :amount, :_destroy],
        references_attributes: [:id, :first_name, :second_name, :f_last_name, 
          :s_last_name, :mobile, :relation_type]);
  end
end
