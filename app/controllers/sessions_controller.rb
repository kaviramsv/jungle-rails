class SessionsController < ApplicationController
  
    # If the user exists AND the password entered is correct.
    # if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      # if user = User.authenticate_with_credentials(params[:email], params[:password])
      # user = User.find_by_email(params[:email])
      # if user && user.authenticate(params[:password])
    def create    
        # success logic, log them in
        if user = User.authenticate_with_credentials(params[:email], params[:password])  
          session[:user_id] = user.id
          redirect_to '/'
         
        else
          # failure, render login form
          redirect_to '/login'
        
      end
    end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
