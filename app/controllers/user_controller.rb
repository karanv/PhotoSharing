class UserController < ApplicationController
  def login
     if(session[:logged_in] !=nil)
        flash[:notice] = "You are already registered and logged in!"
        redirect_to("/pics/user/#{session[:logged_in]}")
      end
  end

  def post_login
       if User.where(login: params[:User][:login]).size > 0
              @myUser = User.where(login: params[:User][:login]).first
                 
                  if(@myUser.password_valid?(params[:User][:password])==0)
                     session[:logged_in] = @myUser.id   
                     flash[:notice] = "Login successful, Welcome #{@myUser.first_name}"
                     redirect_to(:controller => 'pics',:action=>'user', :id=>@myUser.id)
                  else
                     session[:logged_in] = nil
                     flash[:notice] = "Password doesn't match corresponding to user #{params[:User][:login]}" 
                     redirect_to("/user/login")
                  end               
                 
               else
                 flash[:notice] = "User doesn't exist!" 
                 redirect_to("/user/login")
               end
  end

  def logout
        session[:logged_in] = nil
        redirect_to("/user/login")
  end
  
  def register
        if(session[:logged_in] !=nil)
          flash[:notice] = "You are already registered and logged in!"
          redirect_to("/pics/user/#{session[:logged_in]}")
        end
        @user = User.new
  end
    
  def post_register
      @user = User.new(params[:user])
      if (@user.save)
        redirect_to("/user/login")
      else
        flash[:notice] = "These errors prohibited this user from being registered: "
        @user.errors.full_messages.each do |msg|
          flash[:notice] << msg
        end
        redirect_to("/user/register")
      end
  end
end
