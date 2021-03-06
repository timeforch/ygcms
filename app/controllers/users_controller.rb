require File.expand_path('../../../lib/dubbo_service', __FILE__)
require 'hessian2'

class UsersController < ApplicationController
  respond_to :json
  # GET /users
  # GET /users.json
  def index
    @user_service = UsersService.new
    @users = @user_service.get_users
    respond_with(@users) do |format|
      format.html # index.html.erb
      format.json
    end
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

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  def get_full_url_by_commodity_no
    commodity_no = params[:commodity_no]
    commodity_no ||= ""
    url = "{result:'success',msg:'no data'}"
    begin
      if not commodity_no.empty?
        @dubbo_service =  DubboService.new
        url = @dubbo_service.exec(DubboService::GetFullCommodityPageUrl,commodity_no)
      end
    rescue Exception

      url = "{result:'errors',msg:'call remote service fail#{ $! }'}"
    end

    respond_with(url)
  end

end
