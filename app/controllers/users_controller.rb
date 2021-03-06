class UsersController < ApplicationController
  before_action :set_user, only: [:show,:destroy]
  load_and_authorize_resource
  before_filter :current_nav_identifier
  before_filter :check_dbs_permission, only: [:edit_dbs_check,:view_dbs_status,:update_dbs_check]


 def view_dbs_status
   @users = User.where(approved: true).order(:level)
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

  def contact_users


    @users = User.where(approved: true).sort_by {|e|[e.first_name]}

  end

  def contact_users2

    @parents = User.get_users_by_role 'Parent' if params[:parents].to_i == 1
    @swimmers = User.get_users_by_role 'Swimmer' if params[:swimmers].to_i == 1
    @coaches = User.get_users_by_role 'Coach' if params[:coaches].to_i == 1
    @committee = User.get_users_by_role 'Committee' if params[:committee].to_i == 1


    unless @swimmers.nil?
      @temp = []
      @swimmers.each do |user|
        if user.swimmer.email_parent
          @temp << user.swimmer.parents.first.user
        end
      end
    end

    @users = (@parents ||= []) + (@swimmers ||= []) + (@coaches ||= []) + (@committee ||= [] )+ (@temp ||= [])
    @users.uniq!
    @users = @users - User.where(id: current_user.id)
    if @users.empty?
      redirect_to users_contact_users_path, alert: 'Please select at least one group'
      return
    end

   UserNotifier.contact_user(@users,params[:subject],params[:body],current_user.combined_name).deliver

    redirect_to :home, notice: 'Your message was sent successfully'

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
        Notification.create(user_id: current_user.id,notifiable_id: current_user.id, notifiable_type: 'Role')

        # AppMailer.user_update_mail(@user).deliver
        UserNotifier.activated(@user).deliver

        redirect_to users_path, notice: 'User was successfully updated.'
      else
        render action: 'show'
      end

  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.json
  def destroy

    @user.destroy
    respond_to do |format|
      if session[:temp_swimmer_user_id] || session[:tmp_parents_user_id]

        format.html { redirect_to new_user_url, notice: 'Your registration has been canceled'}
        session[:temp_swimmer_user_id] = nil
        session[:tmp_parents_user_id] = nil
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
