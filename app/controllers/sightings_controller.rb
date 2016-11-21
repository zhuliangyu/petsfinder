class SightingsController < ApplicationController
  before_action :set_sighting, only: [:show, :edit, :update, :destroy]

  #  http://localhost:3000/sightings.json
  def index
    @sightings = Sighting.all

    render json: @sightings.to_json
  end

  #  http://localhost:3000/sightings/1.json
  def show
    @sighting = Sighting.find params[:id]
    @user = current_user

  end

  # GET /tutors/new
  def new
    @sighting = Sighting.new
  end

  # GET /tutors/1/edit
  def edit
  end

  #http://localhost:3000/sightings.json?sighting[pet_type]=123
  def create

    # session[:user_id]='adasd'
    # @user_id=params[:user_id]
    @sighting = Sighting.new(sighting_params)
    @sighting.user=current_user

    # respond_to do |format|
      if @sighting.save

        # if user_sign_in?
        #   user=current_user
        # end

        # format.html { redirect_to @sighting, notice: 'Sighting was successfully created.' }

        # format.json { render :show, status: :created, location: @tutor }
        redirect_to sighting_path(@sighting)
        # format.html { render :new }
        # format.json { render json: @sighting.errors }
      end
    # end
  end

  # PATCH/PUT /tutors/1
  # http://localhost:3000/sightings.json?sighting[pet_type]=345

  def update
    respond_to do |format|
      if @sighting.update(sighting_params)
        # format.html { redirect_to @tutor, notice: 'Tutor was successfully updated.' }
        # format.json { render :show, status: :ok, location: @tutor }
        format.json { render json: @sighting }
      else
        # format.html { render :edit }
        format.json { render json: @sighting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tutors/1

  # http://localhost:3000/sightings.json/1
  def destroy
    @sighting.destroy
    respond_to do |format|
      # format.html { redirect_to tutors_url, notice: 'Tutor was successfully destroyed.' }
      # format.json { head :no_content }
      format.json { render json: {status: "successfully delete"} }


    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sighting
    if params[:id]
      @sighting = Sighting.find(params[:id])
    else
      @sighting = Sighting.find(params[:user_id])

    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sighting_params
    params.require(:sighting).permit(
        :pet_type,
        :date_seen,
        :note,
        :images,
        :contact,
        :address,
        :longitude,
        :latitude,
        :user_id
    )
  end
end
