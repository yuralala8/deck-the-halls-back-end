class Api::V1::PartiesController < ApplicationController
  before_action :authorized, only: [:index, :create, :update, :destroy]
  
  def index
    my_parties = current_user.parties
    parties = my_parties.map do |party| 
      {info: party, participants: party.users.map{|user| {username: user.username, id: user.id}}, matches: party.santa_organizers}
    end

    render json: parties
  end
  
  def create
  	@party = Party.new(host_name: current_user.username, location: params[:location], date: params[:date], amount: params[:amount])
  	@party.save

    @participants = params[:participants]
    @participants.push(current_user.username)

    @participants_instances = @participants.map{|person| User.all.find{|user| user.username == person}}
    @participants_instances.map{|person| person.parties << @party}

    santa_matches = @participants_instances.shuffle
    santa_matches << santa_matches.first
    assignments = santa_matches.each_cons(2).to_a
    matched_ids = assignments.map{|match| match.map{|user| user.id}}

    matched_ids.map{|pair| SantaOrganizer.create(party_id: @party.id, giver_id: pair[0], receiver_id: pair[1])}

    matches = SantaOrganizer.select{|match| match.party_id == @party.id}

    party = {party: {info: @party, participants: @participants_instances.map{|user| {username: user.username, id: user.id}}, matches: matches}}
  
  	render json: party
  end
  
end
