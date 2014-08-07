class Users::RegistrationsController < Devise::RegistrationsController

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :check_temp_session
  skip_before_filter :authenticate_user!
  before_filter :set_nav_identifier




  def check_temp_session

      redirect_to  new_swimmer_url, notice: 'Please Complete Your Registration' if session[:temp_swimmer_user_id]
      redirect_to  new_parent_url, notice: 'Please Complete Your Registration' if session[:temp_parent_user_id]
  end

  def create

        if simple_captcha_valid?
        super
      else
        build_resource
        clean_up_passwords(resource)
        flash[:error] = 'There was an error with the captcha code below. Please re-enter the code and click submit.'
        render '/app/views/devise/registrations/new'
        flash[:error] = nil

    end
  end



  protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name,:last_name,:level) }
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :level,:captcha,:captcha_key]
    devise_parameter_sanitizer.for(:account_update) << [:first_name, :last_name, :level]

  end

  def after_sign_up_path_for(resource)

    users_profile_url(resource)


  end

  # def after_update_path_for(resource)
  #
  #   redirect_to users_profile_url(resource)
  # end


  def after_inactive_sign_up_path_for(resource)
    # session[:user] = resource.id
    # user = resource

    if resource.level == 'Swimmer'

      flash[:notice] = 'Please Complete Your Registration'
      session[:temp_swimmer_user_id] = resource.id
      new_swimmer_path

    elsif resource.level == 'Parent'

      flash[:notice] = 'Please Complete Your Registration'
      session[:temp_parent_user_id] = resource.id
      new_parent_path

    else

      :awaiting
    #else
    #
    #  :home
    end
  end

  def after_update_path_for(resource)
    puts resource
    users_profile_url resource
  end

  def set_nav_identifier
    @current_nav_identifier = :signup
  end


end
