class CalendarController < ApplicationController
  # skip_before_filter :authenticate_user!


  def index

    @events = Event.all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

  end
end
