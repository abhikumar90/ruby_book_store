class UsersController < ApplicationController
  def login
     @user = User.new
  end
  
    def create
    @user = User.new(user_params)
    if @user.save
      redirect_to log_in_url, :notice => "Signed up!"
    else
      render "login"
    end
    
  end
  
  def user_params
    params.require(:user).permit(:id, :email, :password, :salt, :encrypted_password)
  end
  
  
  
  
end
