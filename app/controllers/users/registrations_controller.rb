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
    puts "resource id .........................."
    session[:user] = resource.id
    #@useruser = resource
    puts resource.id
    puts "resource khodesh .............."
    p resource
    #user = User.get_user_from_params params[:user]
    user = resource

    if user.level == 'Swimmer'
      flash[:notice] = "now fill in this field"
      flash[:id] = user.id
      :home
    elsif user.role == "Parent"
      :home
    else
      :awaiting
    end
  end

  def after_update_path_for(resource)
    current_user
  end


end
