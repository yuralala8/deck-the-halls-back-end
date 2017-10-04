class Api::V1::UsersController < ApplicationController
  before_action :authorized, only: [:me]
  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(username: params[:username], password:params[:password])
    if @user.save
      payload = { user_id: @user.id}
      render json: {user: @user, jwt: issue_token(payload)}
      ## send some message for success
    else
      ## send some error message
    end
  end


  def me
    render json: current_user
  end

  def info
    @me = current_user
    @me[:bio] = params[:userInfo][:userBio]
    @me.save
    @me[:pro_pic] = params[:userInfo][:profileImage]
    @me.save

    @users = User.all.map{|user| {"id": user.id, "username": user.username, "propic": user.pro_pic, "bio": user.bio}}
   render json: {me: @me, users: @users}
  end

  def all_info

  end

end
