class Api::V1::WeathersController < ApplicationController

    def index()
        # type = params["current"]
        # location = params["94040"]
        @weather = find_weather(type, location)
        render json: @weather


    end

    def find_weather(type="current", location="94040")
    
    request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us&appid=a58a0e27e4df6f0212f846af7a8adba8")

    end

end