class PetsController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]
  # before_action :authorize_access, only: [:edit, :update, :destroy]
  before_action :find_pet, only: [:edit, :update, :destroy, :show]

  def new
    @pet = Pet.new
  end


  def create
    # @pet = Pet.new pet_params


    # pet_attr = params.require(:pet).permit(:address)
    @pet = Pet.new pet_params
    @pet.user = current_user

    if @pet.save
      redirect_to pet_path(@pet)
    else
      render :new
    end

    #respond_to do |format|
    #   format.html { render }
    #   format.text { render }
    #   format.xml  { render xml: @pets }
    #format.json { render json: @pet.to_json }
    #end

    # if @pet.facebook_this
    # client = Facebook::REST::Client.new do |config|
    # config.consumer_key        = ENV['FACEBOOK_CONSUMER_KEY']
    # config.consumer_secret     = ENV['FACEBOOK_CONSUMER_SECRET']
    # config.access_token        = current_user.oauth_token
    # config.access_token_secret = current_user.oauth_secret
    # end
    # client.update @pet.title
    # end
  end


  def show
    @pet = Pet.find params[:id]
    @user = current_user
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml { render xml: @pet }
      format.json { render json: @pet.to_json }
    end
  end

  def index
    @pets = Pet.order(created_at: :desc)
    respond_to do |format|
      format.html { render }
      format.text { render }
      format.xml { render xml: @pets }
      format.json { render json: @pets.to_json }
    end
  end


  def edit
  end

  def update
    @pet.update pet_params
    respond_to do |format|
      #   format.html { render }
      #   format.text { render }
      #   format.xml  { render xml: @pets }
      format.json { render json: @pet.to_json }
    end
  end


  def destroy


    @pet.destroy
    respond_to do |format|
      #   format.html { render }
      #   format.text { render }
      #   format.xml  { render xml: @pets }
      format.json { render json: {status: "successfully delete"} }

    end
  end

  def geo_search

    address=params[:address]

    location = Geocoder.search(address)
    # lat=location[0].latitude
    lat=51
    lon=location[0].longitude
    range=postion(lat, lon)
    lat_range=range[0]
    lat_small=lat_range[0].to_s
    lat_large=lat_range[1].to_s
    lon_range=range[1]
    lon_small=lon_range[0].to_s
    lon_large=lon_range[1].to_s

    query = "SELECT * FROM pets WHERE longitude BETWEEN "+lon_small+" AND "+lon_large+" and latitude BETWEEN "+lat_small+" AND "+lat_large


    @pets = ActiveRecord::Base.connection.execute(query)




  end

  private

  def pet_params
    params.require(:pet).permit([:pet_type,
                                 :breed,
                                 :name,
                                 :sex,
                                 :color,
                                 :age,
                                 :address,
                                 :date_seen,
                                 :note,
                                 :images,
                                 :lost,
                                ])
    # params.require(:pet).permit([:address])
  end

  def find_pet
    @pet = Pet.find params[:id]
  end

  def postion(lat, lon)
    # Position, decimal degrees
    # lat = 51.0
    # lon = 0.0

    # Earth’s radius, sphere
    r=6378137.0

    # offsets in meters
    dn = 500.0
    de = 500.0

    pi=3.1415926

    # Coordinate offsets in radians
    dLat = dn/r*1.0
    dLon = de/(r*Math.cos(Math::PI*lat/180))

    # OffsetPosition, decimal degrees
    lat1 = lat + dLat * 180/Math::PI
    lat0 = lat - dLat * 180/Math::PI

    lon1 = lon + dLon * 180/Math::PI
    lon0 = lon - dLon * 180/Math::PI

    [[lat0, lat1], [lon0, lon1]]


  end

end
