class CalendarController < ApplicationController


  def index

    @events = User.all
    @date = params[:month] ? Date.parse(params[:month]) : Date.today

  end
end
