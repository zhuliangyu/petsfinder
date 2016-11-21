class MessagesController < ApplicationController
  before_action :authenticate_user, except: [:index, :show]
   # before_action :authorize_access, only: [:edit, :update, :destroy]
   before_action :find_message, only: [:edit, :update, :destroy, :show]


   def new
      @message = Message.new
   end



   def create
    @message = Message.new message_params
    @message.user = current_user
    respond_to do |format|
    if @message.save
      format.html {redirect_to message_path(@message),
      notice: "Message Sent!"}
      format.js { render :create_success}
    else
      # render :json => { :errors => @message.errors.full_messages}
      format.html {render :create_success}
      format.js {render :create_failure}
    end
    end
    end
       # if @message.facebook_this
         # client = Facebook::REST::Client.new do |config|
           # config.consumer_key        = ENV['FACEBOOK_CONSUMER_KEY']
           # config.consumer_secret     = ENV['FACEBOOK_CONSUMER_SECRET']
           # config.access_token        = current_user.oauth_token
           # config.access_token_secret = current_user.oauth_secret
         # end
         # client.update @message.title
       # end



   def show

       respond_to do |format|
         format.html { render }
         format.text { render }
         format.xml  { render xml: @message }
         format.json { render json: @message.to_json }
       end
   end

   def index
       @messages = Message.order(created_at: :desc)
       respond_to do |format|
         format.html { render }
         format.text { render }
         format.xml  { render xml: @messages }
         format.json { render json: @messages.to_json }
       end
   end


   def edit
   end

   def update
      @message.update message_params
   end


   def destroy
      @message.destroy
      respond_to do |format|
      format.js {render :destroy}
      end
    end

   private

   def message_params
     params.require(:message).permit([:title,
                                      :body
                                 ])
   end

   def find_message
     @message = Message.find params[:id]
   end

end
