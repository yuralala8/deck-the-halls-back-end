require 'rest-client'
class Api::V1::SearchesController < ApplicationController
  before_action :authorized, only: [:index,:create]
  
  def index


  end

  def create

    searchTerm = params[:search_term]

    queryParams = ENV["apikey"]
  
    # queryParams = '?' +  URI.escape("apikey", Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")) + '=' + URI.escape("l7xx8f02083884f743f5b51f52b633f65c0d", Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))

    # encodeURIComponent('l7xx8f02083884f743f5b51f52b633f65c0d')
    
    url = "https://api.shop.com/sites/v1/search/Term/" + searchTerm + queryParams

    results = JSON.parse(RestClient.get(url))


    render json: results

  end


end
