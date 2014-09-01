class HomeController < ApplicationController
  # skip_before_filter :authenticate_user!
  # before_filter :authenticate_user!
  before_filter :set_nav_identifier

  def welcome

    @post = Post.last

  end

  private

  def set_nav_identifier

    @current_nav_identifier = :home

  end
end
