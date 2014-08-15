class ApplicationController < ActionController::Base
   include SimpleCaptcha::ControllerHelpers

   before_filter :authenticate_user!



   # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
   protect_from_forgery with: :exception
  # before_filter :check_temp_session

  # Catch NotFound exceptions and handle them neatly, when URLs are mistyped or mislinked

   rescue_from ActiveRecord::RecordNotFound do
     @current_nav_identifier = :home
     #flash[:error] = "The page does not exist"
     render template: 'errors/not_found', status: 404
   end

   before_filter do
     resource = controller_name.singularize.to_sym
     method = "#{resource}_params"
     params[resource] &&= send(method) if respond_to?(method, true)
   end

   rescue_from CanCan::AccessDenied do |exception|
     flash[:error] = exception.message
     redirect_to root_path
   end

  private


end
