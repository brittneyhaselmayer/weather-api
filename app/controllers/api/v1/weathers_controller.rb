
class Api::V1::WeathersController < ApplicationController

    def index()
       
        forecastType = params[:forecastType]
        forecastLocation = params[:forecastLocation]
        unit = params[:units]
        lat = params[:lat]
        lon = params[:lon]

        case forecastLocation
            when "\"current\""
                @weather = find_weather(forecastType, lat, lon, unit)
            # when "\"fav_location\""
            #     @weather = find_weather_by_fav_loc(forecastType, lat, lon, unit)
            else
                @weather = find_weather(forecastType, lat, lon, unit)
        end

        # byebug
        render json: @weather
    end

    def request_api(url)
        response = Excon.get(
            url,
            headers: {
                'X-RapidAPI-Host' => URI.parse(url).host,
                # 'X-RapidAPI-Key' => "79aba10b19864eeab4fe804420172aaf"
            }
        )
        # byebug
        return nil if response.status != 200
        JSON.parse(response.body)
    end

    def find_weather(type, lat, lon, unit)
    puts "------------"
    puts lat
    puts lon
        case type
        when "\"current\""
            request_api("https://api.weatherbit.io/v2.0/current?lat=#{lat}&lon=#{lon}&units=#{unit}&key=#{ENV["WEATHER_API_KEY"]}")
        when "\"hourly\""
            # request_api("https://api.weatherbit.io/v2.0/forecast/hourly?lat=#{lat}&lon=#{lon}&units=#{unit}&hours=12&key=#{ENV["WEATHER_API_KEY"]}")
            request_api("https://api.weatherbit.io/v2.0/forecast/hourly?lat=#{lat}&lon=#{lon}&units=#{unit}&hours=12&key=#{ENV["WEATHER_API_KEY"]}")
        when "\"daily\""
            request_api("https://api.weatherbit.io/v2.0/forecast/daily?lat=#{lat}&lon=#{lon}&days=7&units=#{unit}&key=#{ENV["WEATHER_API_KEY"]}")
        else
            request_api("https://api.weatherbit.io/v2.0/current?lat=#{lat}&lon=#{lon}&units=#{unit}&key=#{ENV["WEATHER_API_KEY"]}")
        end
    end 
puts "https://api.weatherbit.io/v2.0/forecast/hourly?lat=#{lat}&lon=#{lon}&units=#{unit}&hours=12&key=#{ENV["WEATHER_API_KEY"]}"
    # def find_weather_by_fav_loc(type="current", lat, lon)
    
    #     case type
    #     when "\"current\""
    #         request_api("https://api.weatherbit.io/v2.0/current?lat=#{lat}&lon=#{lon}&key=#{ENV["WEATHER_API_KEY"]}")
    #     when "\"hourly\""
    #         request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us")
    #     when "\"daily\""
    #         request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us")
    #     else
    #         request_api("http://api.openweathermap.org/data/2.5/weather?zip=#{location},us")
    #     end
    # end 

end