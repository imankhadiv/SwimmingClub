class SwimmersController < ApplicationController
  before_action :set_swimmer, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  before_filter :stop_administrator, only: [:index,:medical_conditions]
  skip_before_filter :authenticate_user!, only: [:new,:cancel_swimmer_registration,:create]
  skip_authorize_resource only: [:new,:cancel_swimmer_registration,:create]
  before_filter :set_nav_identifier


  def swimmer_times

    @swimmer = Swimmer.find(params[:id])
    @swimmer_times = @swimmer.details_of_times

    time = SwimmerTime.where(swimmer_id:params[:id]).sort_by {|date| date.date}
     @years_ago = Time.now.year - time.first.date.year unless time.empty?

  end

  # GET /swimmers
  # GET /swimmers.json
  def index
    if current_user.role? 'Welfare Officer'
      @swimmers = Swimmer.all
    elsif current_user.role? 'Swimmer'
      redirect_to medical_conditions_swimmer_path(current_user.swimmer.id)
    else
      @swimmers = Parent.find(current_user.parent.id).swimmers
    end

  end

  # GET /swimmers/1
  # GET /swimmers/1.json
  # def show
  # end

  # GET /swimmers/new
  def new
    user = User.where(id: session[:temp_swimmer_user_id])
    if user.empty?
      session[:temp_swimmer_user_id] = nil
      redirect_to new_user_registration_path, notice: 'Sign Up'

    elsif session[:temp_swimmer_user_id]
    @swimmer = Swimmer.new
    @swimmer.build_address
    @swimmer.build_medical_condition
    @swimmer.medical_condition.build_address
    else
      redirect_to new_user_registration_path, notice: 'Sing Up'
    end
  end

  # GET /swimmers/1/edit
  def edit
  end

  def medical_conditions

    if current_user.role? 'Welfare Officer'
      @swimmer = Swimmer.find(params[:id])
    elsif current_user.role? 'Swimmer'
       @swimmer = Swimmer.find(current_user.swimmer.id)
    else
      swimmers = Parent.find(current_user.parent.id).swimmers
      if swimmers.ids.include? params[:id].to_i
        @swimmer = Swimmer.find(params[:id])
      end
    end
  end

  def payment
    @swimmer = Swimmer.find(params[:id])
  end


  # POST /swimmers
  # POST /swimmers.json
  def create
    @swimmer = Swimmer.new(swimmer_params)

    respond_to do |format|
      if @swimmer.save
        #format.html { redirect_to @swimmer, notice: 'Swimmer was successfully created.' }
        format.html { redirect_to :awaiting, notice: 'Sign up successful' }
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
        format.html { redirect_to users_profile_url, notice: 'Your details was successfully updated.' }
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

  def cancel_swimmer_registration
    user = User.find(session[:temp_swimmer_user_id])
    user.destroy
    session[:temp_swimmer_user_id] = nil
    redirect_to new_user_registration_url, notice: "Registration canceled!\n Please try again"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimmer
      @swimmer = Swimmer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swimmer_params
      params.require(:swimmer).permit(:asa_number,:email_parent, :asa_category, :date_of_birth, :sex, :photo_consent, :current_squad, :user_id,:ethnic, address_attributes: [:line1, :line2, :city, :postcode, :telephone, :emergency_contact, :addressable_id, :addressable_type],medical_condition_attributes: [:medical_history,:medication,:allergies,:doctor,:disability,address_attributes: [:line1, :line2, :city, :postcode, :telephone, :emergency_contact, :addressable_id, :addressable_type]])
    end
    def stop_administrator


      unless ((current_user.role? 'Welfare Officer')||( current_user.role? 'Parent') ||(current_user.role? 'Swimmer' ))
        redirect_to :home, alert: 'You are not authorized to access this page!'
      end

    end
    def set_nav_identifier
  
      @current_nav_identifier = :medical
  
    end

end
