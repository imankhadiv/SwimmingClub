class UsersController < ApplicationController
  before_action :set_user, only: [:show,:destroy]
  load_and_authorize_resource

  # before_filter :check_user_level
  # skip_before_filter :authenticate_user!
  before_filter :current_nav_identifier
  before_filter :check_dbs_permission, only: [:edit_dbs_check,:view_dbs_status,:update_dbs_check]


 def view_dbs_status
   @users = User.all.order(:level)
 end

  def edit_dbs_check

  end

  def update_dbs_check

    @user = User.find(params[:id])
    # if @user.update(dbs_chesck: params[:dbs_check],dbs_expiry_date: params[:dbs_expiry_date])
    if @user.update(user_params)
      redirect_to users_view_dbs_status_path, notice: 'User was successfully updated.'
    else
      render action: 'edit'
    end

  end


  def index

    @awaiting_users = User.awaiting_users
    @approved_users = User.get_approved_users

  end

  def profile

    unless current_user

    redirect_to new_user_session_path, notice: 'Please Sign in'

    else

       @user = current_user
       Notification.remove_roles_notification current_user.id, 'Role'

    end

  end
  def show
    @user_profile = User.user_profile @user.id

  end

  def edit

  end
  # PATCH/PUT /swimmers/1
  # PATCH/PUT /swimmers/1.json
  def update
      @user = set_user
      if @user.update(user_params)
        # AppMailer.user_update_mail(@user).deliver
        UserNotifier.activated(@user).deliver

        redirect_to users_path, notice: 'User was successfully updated.'
      else
        render action: 'show'
      end

      # @user = set_user
      # if @user.approved
      #   @user.approved = false
      # else
      #   @user.approved = true
      #   UserNotifier.activated(@user).deliver
      #
      # end
      #
      # @user.save
      # redirect_to users_url, notice: 'User was successfully approved' if @user.approved
      # redirect_to users_url, notice: 'User was successfully suspended' unless @user.approved

  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      if session[:temp_swimmer_user_id] || session[:temp_parent_swimmer_id]

        format.html { redirect_to new_user_url, notice: 'Your registration has been canceled'}
        session[:temp_swimmer_user_id] = nil
        session[:temp_swimmer_parent_id] = nil
      else
      format.html { redirect_to users_url, notice: 'User was successfully deleted' }
      end
      format.json { head :no_content }
    end
  end


  private
  #Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # sets the permitted attributes for a user
  def user_params
    params.require(:user).permit(:approved,:dbs_check,:dbs_expiry_date, :role_ids => [])
  end

  #Never trust parameters from the scary internet, only allow the white list through.
  #def user_params
  #  params.require(:user).permit(:approved,:id)
  #end
  def check_user_level

    if !current_user
    redirect_to :home, alert:'You need to log in to view this page'
    elsif current_user.level != 'Administrator'
    redirect_to :home, alert: 'You do not have permission to access this page'
    else
      index
    end

  end

  def current_nav_identifier
    if action_name == 'profile'
      @current_nav_identifier = :profile
    else

     @current_nav_identifier = :users

    end

  end

  def check_dbs_permission
    unless current_user.role? 'Welfare Officer'
      redirect_to :home, alert: 'You do not have permission to access this page'
    end
  end


end
