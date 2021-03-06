class UsersController < ApplicationController
  load_and_authorize_resource
  
  layout 'admin'
  
  # GET /users
  # GET /users.json
  def index
    @users = User.page(params[:page]).per(10)
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    @roles = Role.all
    
    render :layout => "public_full" unless can? :manage, :all
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  # POST /users
  # POST /users.json
  def create
    params[:user].delete(:role_id) unless can? :manage, User 
    @user = User.new(params[:user])

    if @user.save
      redirect_to login_path, notice: 'User was successfully created.' 
    else
      @roles = Role.all
      render action: "new", layout: 'public'
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    params[:user].delete(:role_id) unless can? :manage, User 
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.' 
    else
      @roles = Role.all
      render action: "edit", layout: 'public' 
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    
    redirect_to :back
  end
end
