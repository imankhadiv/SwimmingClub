class HomeController < ApplicationController
  skip_before_filter :authenticate_user!
  # before_filter :authenticate_user!

  def welcome

  end
end
