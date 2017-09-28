class Api::V1::PartiesController < ApplicationController
  before_action :authorized, only: [:index, :create, :update, :destroy]
  
  

end
