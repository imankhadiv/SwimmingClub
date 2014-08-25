class SwimmingRecordsController < ApplicationController
  before_action :set_swimming_record, only: [:show, :edit, :update, :destroy]

  load_and_authorize_resource


  def import_times

    if params[:file].nil?
      redirect_to update_system_swimming_records_url,alert: 'please upload a csv file!'
      return
    end

    name = params[:file].original_filename

    if File.extname(name) != '.csv'
      redirect_to update_system_swimming_records_url,alert: 'please upload a csv file!'
      return
    end
    directory = 'public/images/uploads'
    if File.exist?("#{directory}/#{name}")
      redirect_to update_system_swimming_records_url, alert: 'This file has been uploaded before'
      return
    end

    path = File.join(directory, name)
    File.open(path, 'wb') { |f| f.write(params[:file].read) }

    SwimmingRecord.import_times params[:file]
    redirect_to swimming_records_url, notice: 'Swimming records imported successfully'

  end

  def update_system

  end

  def results

    @records = SwimmingRecord.where(information: params[:information]).group_by {|e|[e.first_name,e.last_name]}

  end
  def synchronise


    SwimmingRecord.synchronise_club_times
    redirect_to :home, notice: 'Times updated successfully!'

  end
  # GET /swimming_records
  # GET /swimming_records.json
  def index
    # @swimming_records = SwimmingRecord.all
    @results = SwimmingRecord.all.group_by {|e| [e.information]}
  end

  # GET /swimming_records/1
  # GET /swimming_records/1.json
  def show
    # render text: params
  end

  # GET /swimming_records/new
  def new
    # @swimming_record = SwimmingRecord.new
  end

  # GET /swimming_records/1/edit
  def edit
  end

  # POST /swimming_records
  # POST /swimming_records.json
  def create


    @swimming_record = SwimmingRecord.new(swimming_record_params)

    respond_to do |format|
      if @swimming_record.save
        format.html { redirect_to @swimming_record, notice: 'Swimming record was successfully created.' }
        format.json { render :show, status: :created, location: @swimming_record }
      else
        format.html { render :new }
        format.json { render json: @swimming_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /swimming_records/1
  # PATCH/PUT /swimming_records/1.json
  def update

    # respond_to do |format|
    #   if @swimming_record.update(swimming_record_params)
    #     format.html { redirect_to @swimming_record, notice: 'Swimming record was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @swimming_record }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @swimming_record.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /swimming_records/1
  # DELETE /swimming_records/1.json
  def destroy
    @swimming_record.destroy
    respond_to do |format|
      format.html { redirect_to swimming_records_url, notice: 'Swimming record was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_swimming_record
      @swimming_record = SwimmingRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def swimming_record_params
      params.require(:swimming_record).permit(:information,:first_name, :last_name, :date_of_birth, :gender, :stroke, :distance, :level, :meet, :venue, :time, :age, :date, :region, :region, :region_code)
    end
end
