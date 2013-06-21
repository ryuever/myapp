class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update, :destroy,:index]
  before_filter :correct_user, only: [:edit, :update, :destroy]
  before_filter :admin_user, only: :destroy
  # GET /users
  # GET /users.json
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page])
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @user = User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params[:user])

    if @user.save
      sign_in @user
      flash[:success] = "welcome !"
      redirect_to @user
    else
      render "new"
    end
  end
    # respond_to do |format|
    #   if @user.save
    #     flash[:success] = "Welcome To!"
    #     redirect_to @user
    #     format.html { redirect_to @user, alert: 'User was successfully created.' }
    #     format.json { render json: @user, status: :created, location: @user }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    # end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        render 'edit'
        # format.html { render action: "edit" }
        # format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User destroyed"
    redirect_to users_path
    end
  end

  private 
  def signed_in_user
    store_location
    redirect_to signin_path, notice: "please sign in" unless signed_in?
  end
  
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_path) unless current_user?(@user)
  end

  def admin_user
    redirect_to(root_path) unless current_user.admin?
end
