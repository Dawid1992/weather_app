class ForecastController < ApplicationController
  before_action :current_user

  def show
    # users_city = current_user.users_cities.eager_load(:city).find(params[:users_city_id])
    @user_city = UsersCity.find_by(user_id: current_user.id, id:params[:id])

    require 'net/http'
    require 'json'

    @url = "http://api.openweathermap.org/data/2.5/weather?q=#{@user_city.name},#{@user_city.country}&appid=17ac356fce697a753b9474155a92c222&units=metric"
    @url = URI.parse(URI.escape(@url))
    @response = Net::HTTP.get(@url)
    @output = JSON.parse(@response)


  end
end
