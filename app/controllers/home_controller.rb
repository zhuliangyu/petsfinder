class HomeController < ApplicationController
  def index
    @user = User.find (session[:user_id]) if user_signed_in?
    @pets = Pet.all
    @hash = Gmaps4rails.build_markers(@pets) do |pet, marker|
      marker.lat pet.latitude
      marker.lng pet.longitude
    end

    @arr = []
    @hash.each do |value|
      @arr.push(value.values.to_a)
    end
    p @arr
  end


end
