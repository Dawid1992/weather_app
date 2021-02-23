class UsersCitiesController < ApplicationController
  # before_action :logged_in?, only: [:index, :show, :create, :destroy]
  before_action :authenticate_user!

  def index
    @users_cities = UsersCity.where(user_id: current_user.id)
  end

  def show

  end

  def new
    @users_cities = UsersCity.new
  end

  def create
    require 'net/http'
    require 'json'

    @url = "http://api.openweathermap.org/data/2.5/weather?q=#{params[:users_city][:name]},#{params[:users_city][:country]}&appid=17ac356fce697a753b9474155a92c222"
    @url = URI.parse(URI.escape(@url))
    @response = Net::HTTP.get(@url)
    @output = JSON.parse(@response)

    if(@output['cod'] == '404')
      redirect_to new_users_city_path, notice: "Wrong parameters"
    else
      @users_cities = UsersCity.find_or_initialize_by(name: params[:users_city][:name], country: params[:users_city][:country], user_id: current_user.id)
      @users_cities.save!
      redirect_to users_cities_path, notice: 'New city was added'
    end

  end

  def destroy
    city_to_delete = UsersCity.find(params[:id])
    city_to_delete.destroy
    redirect_to users_cities_path, notice: 'City was successfully destroyed.'
  end


end
