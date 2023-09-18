class SessionsController < ApplicationController
    def new 
    
    end

    def create 
        user = User.find_by username: params[:username]

        if user 
            session[:user_id] = user.id if not user.nil?
            redirect_to user, notice: "Welcome back!"
        else 
            redirect_to signin_path, notice: "Username mismatch"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to :root
    end
end