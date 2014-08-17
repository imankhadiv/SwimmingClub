class CompareTimesController < ApplicationController

  def compare

  end


  def search


    @users1 = User.search params[:first_name_1], params[:last_name_1]
    @users2 = User.search params[:first_name_2],params[:last_name_2]
    respond_to do |format|
      if !@users1.empty? && !@users2.empty?
        format.js
      else
        format.js { render 'search_failure' }
      end
    end

  end


  def show

    swimmer1 = User.find(params[:Swimmer1]).swimmer
    swimmer2 = User.find(params[:Swimmer2]).swimmer

    @swimmer_times1 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer1.id).order(:date)
    @swimmer_times2 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer2.id).order(:date)

    if @swimmer_times1.empty? && @swimmer_times2.empty?
      redirect_to compare_times_compare_path, alert: 'No match found!'
    end


  end



end
