class Api::V1::UsersController < ApplicationController

    def index
        user = User.where("username='#{params[:username]}' and password='#{params[:password]}'")
        render json: user
    end

    def create
      @user = User.new(post_params)
      if @user.valid?
        @user.save()
        render json: {message: 'User created'}
      else
        render json: {message: 'User already exists'}
      end
    end

    private

	  def post_params
		  params.require(:user).permit(:username, :password)
    end

end