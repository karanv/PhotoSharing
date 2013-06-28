class ApplicationController < ActionController::Base
  protect_from_forgery  
            
        # # Finds the User with the ID stored in the session with the key
        #      # :current_user_id This is a common way to handle user login in
        #      # a Rails application; logging in sets the session value and
        #      # logging out removes it.
        #        @@_current_user ||= session[:logged_in] &&
        #          User.find(session[:logged_in])
        
end
