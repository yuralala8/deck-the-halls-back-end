require 'rest-client'
class Api::V1::SearchesController < ApplicationController
  before_action :authorized, only: [:index,:create]
  
  def index
    users = User.all.map{|user| {"id": user.id, "username": user.username, "propic": user.pro_pic, "bio": user.bio}}

    render json: users

  end

  def create

    searchTerm = params[:search_term]
    queryParams = ENV["apikey"]
    
    url = "https://api.shop.com/sites/v1/search/Term/" + searchTerm + queryParams

    results = JSON.parse(RestClient.get(url))

    render json: results

  end


end
