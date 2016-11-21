class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params

    # respond_to do |format|
      if @user.save
        # PetMailer.notify_pet_owner(@user).deliver_now
        # render json: @user.to_json
        # session[:user_id] = @user.id
        # format.js { render :success}
        # format.html{
        #   redirect_to root_path
        # }
        session[:user_id] = @user.id
        redirect_to root_path
      else
        # format.js { render :fail }
        # format.html{
        #   render 'users/new'
        #  }
        render :new
      end
    # end
  end

  def show
    @user = User.find params[:id]
    # render json: @user.to_json
    # respond_to do |format|
    #   format.html { render }
    #   format.text { render }
    #   format.xml { render xml: @user }
    #   format.json { render json: @user.to_json }
    # end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update user_params
      # format.json { render json: {status: "successfully delete"} }
      render json: @user.to_json
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit([:first_name,
                                                :last_name,
                                                :email,
                                                :password,
                                                :password_confirmation,
                                                :image,
                                                :city])
  end


end
