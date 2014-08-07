class CalendarController < ApplicationController
  # skip_before_filter :authenticate_user!
  before_filter :set_nav_identifier


  def index

    @events = Event.all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

  end


  private

  def set_nav_identifier
    @current_nav_identifier = :calendar
  end
end
