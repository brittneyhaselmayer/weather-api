class Api::V1::WeathersController < ApplicationController

    def index()
        # type = params["current"]
        # location = params["94040"]
        @weather = find_weather()
        # byebug
        render json: @weather
    end

    def request_api(url)
        response = Excon.get(
            url,
            headers: {
                'X-RapidAPI-Host' => URI.parse(url).host
                # 'X-RapidAPI-Key' => "a58a0e27e4df6f0212f846af7a8adba8"
            }
        )
        # byebug
        return nil if response.status != 200
        JSON.parse(response.body)
    end

    def find_weather(type="current", location="94040")
    
        case type
        when "current"
        request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us&appid=a58a0e27e4df6f0212f846af7a8adba8")
        when "hourly"
            request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us")
        when "daily"
            request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us")
        else
            request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us")
        end
    end 

end