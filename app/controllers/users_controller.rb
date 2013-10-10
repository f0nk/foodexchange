
class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  def index    
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    @is_admin = current_user && current_user.id == @user.id
  end

  # GET /users/new
  def new
    if current_user
      redirect_to root_path, :notice => "You are already registered" 
    end
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      redirect_to @user
    end
  end

  # POST /users
  def create    
    @user = User.new(params[:user])

    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'user was successfully created.'      
    else
      render action: "new"
    end
  end
  
  # PUT /users/1/update
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'user was successfully updated.'
    else
      render :action => 'edit'
    end
  end
end
