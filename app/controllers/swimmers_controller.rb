class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]



  def swimmer_times

    params[:id]
    @swimmer = Swimmer.find(params[:swimmer_id])
    @swimmer_times = @swimmer.details_of_times

    # puts @swimmer.user.first_name

  end

  # GET /swimmers
  # GET /swimmers.json
  def index
    @swimmers = Swimmer.all
  end

  # GET /swimmers/1
  # GET /swimmers/1.json
  def show
  end

  # GET /swimmers/new
  def new
    @swimmer = Swimmer.new
    @swimmer.build_address
    @swimmer.build_medical_condition
    @swimmer.medical_condition.build_address
    # medical = @swimmer.build_medical_condition
    # doctor_address = medical.build_address
  end

  # GET /swimmers/1/edit
  def edit
  end

  def medical_conditions
    @swimmer = Swimmer.find(params[:id])
  end


  # POST /swimmers
  # POST /swimmers.json
  def create
    @swimmer = Swimmer.new(swimmer_params)

    respond_to do |format|
      if @swimmer.save
        #format.html { redirect_to @swimmer, notice: 'Swimmer was successfully created.' }
        format.html { redirect_to :awaiting }
        session[:temp_swimmer_user_id] = nil


        format.json { render :show, status: :created, location: @swimmer }
      else
        format.html { render :new }
        format.json { render json: @swimmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swimmers/1
  # PATCH/PUT /swimmers/1.json
  def update
    respond_to do |format|
      if @swimmer.update(swimmer_params)
        format.html { redirect_to @swimmer, notice: 'Swimmer was successfully updated.' }
        format.json { render :show, status: :ok, location: @swimmer }
      else
        format.html { render :edit }
        format.json { render json: @swimmer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /swimmers/1
  # DELETE /swimmers/1.json
  def destroy
    @swimmer.destroy
    respond_to do |format|
      format.html { redirect_to swimmers_url, notice: 'Swimmer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimmer
      @swimmer = Swimmer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swimmer_params
      params.require(:swimmer).permit(:asa_number, :asa_category, :date_of_birth, :sex, :photo_consent, :current_squad, :user_id,:ethnic, address_attributes: [:line1, :line2, :city, :postcode, :telephone, :emergency_contact, :addressable_id, :addressable_type],medical_condition_attributes: [:medical_history,:medication,:allergies,:doctor,:disability,address_attributes: [:line1, :line2, :city, :postcode, :telephone, :emergency_contact, :addressable_id, :addressable_type]])
    end

end
