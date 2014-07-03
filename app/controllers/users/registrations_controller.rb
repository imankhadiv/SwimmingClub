class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  


  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:level) }
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :level]

  end

  def after_sign_up_path_for(resource)

  end


  def after_inactive_sign_up_path_for(resource)
    # session[:user] = resource.id
    # user = resource

    if resource.level == 'Swimmer'

      flash[:notice] = 'Please Complete Your Registration'
      session[:temp_user_id] = resource.id
      new_swimmer_path

    elsif resource.level == 'Parent'

      flash[:notice] = 'Please Complete Your Registration'
      session[:temp_user_id] = resource.id
      puts resource.id
      new_parent_path

    else

      :awaiting
    #else
    #
    #  :home
    end
  end

  def after_update_path_for(resource)
    current_user
  end


end
