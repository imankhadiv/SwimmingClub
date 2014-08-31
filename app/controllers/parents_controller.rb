class ParentsController < ApplicationController
  before_action :set_parent, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource
  skip_before_filter :authenticate_user!, only: [:new,:cancel_parent_registration,:create,:check_relation]
  skip_authorize_resource only: [:new,:cancel_parent_registration,:create,:check_relation]



  # GET /parents
  # GET /parents.json
  def index
    @parents = Parent.all
  end

  # GET /parents/1
  # GET /parents/1.json
  def show

  end

  # GET /parents/new
  def new
    user = User.where(id: session[:tmp_parent_user_id])
    if user.empty?
      session[:tmp_parent_user_id] = nil
      redirect_to new_user_registration_path, notice: 'Sign Up'

    elsif session[:tmp_parent_user_id]
      @parent = Parent.new
      @parent.build_address
      @swimmers = Swimmer.all
    else
      redirect_to new_user_registration_path, notice: 'Sign Up'
    end
  end

  # GET /parents/1/edit
  def edit
  end

  def check_relation

    user = User.find_by(email: params[:email])

    respond_to do |format|

      if user && user.valid_password?(params[:password])

        @swimmer = Swimmer.find_by(user_id: user.id)
        format.js
      else
         @swimmer = nil
        format.js {}
      end
    end

  end

  # POST /parents
  # POST /parents.json
  def create
     @parent = Parent.new(parent_params)
     ids = params[:swimmer]['ids']

    swimmers = Swimmer.where id: ids

    respond_to do |format|
      if @parent.save
        @parent.swimmers << swimmers

         # format.html { redirect_to @parent, notice: 'Parent was successfully created.' }
         format.html { redirect_to :awaiting}
         session[:tmp_parent_user_id] = nil
         format.json { render :show, status: :created, location: @parent }
      else
        format.html { render :new }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parents/1
  # PATCH/PUT /parents/1.json
  def update
    # @parent = Parent.new(parent_params)
    ids = params[:swimmer]['ids']

    swimmers = Swimmer.where id: ids
    respond_to do |format|
      if @parent.update(parent_params)
        @parent.swimmers << swimmers

        format.html { redirect_to users_profile_path, notice: 'your profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent }
      else
        format.html { render :edit }
        format.json { render json: @parent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parents/1
  # DELETE /parents/1.json
  def destroy
    @parent.destroy
    respond_to do |format|
      format.html { redirect_to parents_url, notice: 'Parent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def cancel_parent_registration
    user = User.find(session[:tmp_parent_user_id])
    user.destroy
    session[:tmp_parent_user_id] = nil
    redirect_to new_user_registration_url, notice: "Registration canceled!\n Please try again"
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent
      @parent = Parent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_params
      params.require(:parent).permit(:relation, :user_id, address_attributes: [:line1, :line2, :city, :postcode, :telephone, :emergency_contact, :addressable_id, :addressable_type])
    end
end
