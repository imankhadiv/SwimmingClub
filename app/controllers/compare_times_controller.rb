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
    swimmer_times1 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer1.id)
    swimmer_times2 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer2.id)
    @swimmer_times1 = swimmer_times1.order(:date)
    @swimmer_times2 = swimmer_times2.order(:date)
    @swimmer_times3 = swimmer_times1.order(:age)
    @swimmer_times4 = swimmer_times2.order(:age)

    # @swimmer_times1 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer1.id).order(:date)
    # @swimmer_times2 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer2.id).order(:date)
    # @swimmer_times3 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer1.id).order(:age)
    # @swimmer_times4 = SwimmerTime.where(stroke: params[:stroke], distance: params[:distance], swimmer_id: swimmer2.id).order(:age)
    if @swimmer_times1.empty? or (@swimmer_times2.empty?)
      redirect_to compare_times_compare_path, alert: 'No match found!'
    end


  end



end
