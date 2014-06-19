class UsersController < ApplicationController
  before_action :set_user, only: [:show]



  def index

    @awaiting_users = User.get_awaiting_users
    @approved_users = User.get_approved_users

  end

  def show
    @user_profile = User.get_user_profile @user.id
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


end
