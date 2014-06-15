class UsersController < ApplicationController


  def index

    @awaiting_users = User.get_awaiting_users
    @approved_users = User.get_approved_users

  end


end
