class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  # before_filter :check_user_level



  def index

    @awaiting_users = User.awaiting_users
    @approved_users = User.get_approved_users

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
      @user.approved = true
      @user.save
      redirect_to users_url, notice: 'User was successfully approved'

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
