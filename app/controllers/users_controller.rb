class UsersController < ApplicationController
  before_action :set_user, only: [:show,:destroy]
  # before_filter :check_user_level



  def index

    @awaiting_users = User.awaiting_users
    @approved_users = User.get_approved_users

  end

  def profile

    unless current_user

    redirect_to new_user_session_path, notice: 'Please Sign in'

    else

       @user = current_user
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
      if @user.approved
        @user.approved = false
      else
        @user.approved = true
        UserNotifier.activated(@user).deliver

      end

      @user.save
      redirect_to users_url, notice: 'User was successfully approved' if @user.approved
      redirect_to users_url, notice: 'User was successfully suspended' unless @user.approved

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


end
