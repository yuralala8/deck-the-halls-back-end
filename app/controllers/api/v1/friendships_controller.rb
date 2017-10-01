class Api::V1::FriendshipsController < ApplicationController
  before_action :authorized, only: [:index, :create, :update, :destroy, :accept, :completed_requests]
  
  def pending_requests
  	@friendships = Friendship.select{|relation| relation.status == "pending"}
    @pending_received = @friendships.select{|f| f.friend_id.to_s == params[:id]}
    @pending_sent = @friendships.select{|f| f.user_id.to_s == params[:id]}

  	render json: {pending_received: @pending_received, pending_sent: @pending_sent}
  end


  def create
    @friendship = Friendship.new(user_id: params[:currentUser], friend_id: params[:friendId], status: "pending")
    @friendship.save

  	my_username = User.find(@friendship.user_id).username
  	friends_username = User.find(@friendship.friend_id).username

  	requestProcess = {friendship_id: @friendship.id, current_user: {user_id: params[:currentUser], username: my_username}, friend: {friend_id: params[:friendId], username: friends_username}}
  	
  	render json: requestProcess
  end

  def completed_requests
    @friends = Friendship.select{|friend| friend.status == "complete" && friend.user_id.to_s == params[:id]}
    my_friends = @friends.map{|relation| relation.friend_id}
    friends_list = my_friends.map{|num| User.all.find{|user| user.id == num}}
    render json: friends_list
  end

  def accept
    @friendship = Friendship.new(user_id: params[:currentUser], friend_id: params[:friendId], status: "complete")
    @friendship.save

    change_status_of = Friendship.find_by(user_id: params[:friendId], friend_id: params[:currentUser])
    change_status_of.status = "complete"
    change_status_of.save
  
    @friendships = Friendship.all

    render json: @friendships
  end


end
