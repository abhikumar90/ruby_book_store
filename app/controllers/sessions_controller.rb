class SessionsController < ApplicationController
  def new
    if current_user
       redirect_to "/new"
  end
  end
  
   def create
     debugger
    user = User.authenticate(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to new_url, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
  
def destroy
  session[:user_id] = nil
  redirect_to "/new", :notice => "Logged out!"
end
  
  
  
end
