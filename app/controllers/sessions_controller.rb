
class SessionsController < ApplicationController
# GET /sessions/new
def new
end

# POST /sessions
def create
  user = User.authenticate params[:email], params[:password]
    if user
      session[:user_id] = user.id
      redirect_to root_path, :notice => "Welcome back to Food Exchange"
    else
      redirect_to :login, :alert => "Invalid email or password"
    end
end

def destroy
  session[:user_id] = nil
  redirect_to root_path :notice => "You have been logged out"
end
end
