class SwimmerTimesController < ApplicationController
  before_action :set_swimmer_time, only: [:show, :edit, :update, :destroy]
  before_filter :set_nav_identifier
  # load_and_authorize_resource


  # GET /swimmer_times
  # GET /swimmer_times.json
  def index
    # @swimmer_times = SwimmerTime.all
    @swimmer_time = SwimmerTime.new
    @swimmers = Swimmer.all
    @females = SwimmerTime.best_times 'Female'
    @males = SwimmerTime.best_times 'Male'

  end

  def best_times
    @females = SwimmerTime.best_times 'Female'
    @males = SwimmerTime.best_times 'Male'
  end


  # GET /swimmer_times/1
  # GET /swimmer_times/1.json
  def show

  end

  #Get
  def search


     @swimmers = Swimmer.sex(params[:gender]) unless params[:gender] == 'All'
     @swimmers = Swimmer.all if params[:gender] == 'All'
     @swimmer_times = SwimmerTime.swimmer @swimmers


    filtering_params(params).each do |key, value|
      @swimmer_times = @swimmer_times.public_send(key, value) if value.present? && value != 'All'
    end


     respond_to do |format|

         format.js

     end

  end

  # GET /swimmer_times/new
  def new
    @swimmer_time = SwimmerTime.new
    # @swimmers = User.swimmers
    @swimmers = Swimmer.all

  end

  # GET /swimmer_times/1/edit
  def edit
    #@swimmer_time = SwimmerTime.new(swimmer_time_params)
    @swimmers = Swimmer.all
    swimmer_time = SwimmerTime.find(params[:id])
    @swimmer = swimmer_time.swimmer

  end

  # POST /swimmer_times
  # POST /swimmer_times.json
  def create
    @swimmer_time = SwimmerTime.new(swimmer_time_params)

    respond_to do |format|
      if @swimmer_time.save
        # format.html { redirect_to @swimmer_time, notice: 'Swimmer time was successfully created.' }
        format.js

        # format.json { render :show, status: :created, location: @swimmer_time }
      else
        # format.html { render :new }

        format.js { render 'create_failure' }
        # format.json { render json: @swimmer_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swimmer_times/1
  # PATCH/PUT /swimmer_times/1.json
  def update
    respond_to do |format|
      if @swimmer_time.update(swimmer_time_params)
        format.html { redirect_to swimmer_times_path, notice: 'Swimmer time was successfully updated.' }
        format.js
        format.json { render :show, status: :ok, location: @swimmer_time }
      else
        swimmer_time = SwimmerTime.find(params[:id])
        @swimmer = swimmer_time.swimmer
        format.html { render :edit }
        format.json { render json: @swimmer_time.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swimmer_times/1
  # DELETE /swimmer_times/1.json
  def destroy
    @id = @swimmer_time.id
    @swimmer_time.destroy
    respond_to do |format|
      format.html { redirect_to swimmer_times_url, notice: 'Swimmer time was successfully destroyed.' }
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimmer_time
      @swimmer_time = SwimmerTime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swimmer_time_params
      params.require(:swimmer_time).permit(:swimmer_id, :stroke, :distance, :times,:course, :club,:meet, :venue,:age, :date, :minutes,:seconds,:milli_seconds,:asa_top_ten,:bml,:asa_meet)
    end
    def filtering_params(params)
       params.slice(:stroke,:date,:distance,:age)
      # params.slice(:length)
    end

  def set_nav_identifier
    @current_nav_identifier = :times
  end
end
