class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email params[:session][:email].downcase if params[:session][:email]
    # byebug
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      # respond_to do |format|
        # format.html { redirect_to tutors_url, notice: 'Tutor was successfully destroyed.' }
        # format.json { head :no_content }
        # format.json { render json: {status: "successfully delete"} }
      redirect_to root_path
      # end
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
