# Override the devise's registrations controller to add required parameters to user.
class RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters

  def create
    super
  end

  private
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:name, :address, :city, :state, :zip, :email, :password,
        :password_confirmation, :role_id, :school, :exp_years)
    end
  end
end