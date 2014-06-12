class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    puts 'hello world dkj ..............................'
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:role) }
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :role]

  end

end
