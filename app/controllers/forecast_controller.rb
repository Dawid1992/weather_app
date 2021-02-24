class ForecastController < ApplicationController
  before_action :current_user
  def show
    @user_city = UsersCity.find_by(user_id: current_user.id, id:params[:id])

    @api_key = ENV['API_KEY']

    require 'net/http'
    require 'json'
    @url = "http://api.openweathermap.org/data/2.5/weather?q=#{@user_city.name},#{@user_city.country}&appid=#{@api_key}&units=metric"
    @url = URI.parse(URI.escape(@url))
    @response = Net::HTTP.get(@url)
    @output = JSON.parse(@response)


  end
end
