class PageController < ApplicationController
  skip_before_filter :authenticate_user!

  def welcome
  end

  def awaiting
  end
end
