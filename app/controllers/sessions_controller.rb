class SessionsController < ApplicationController
    def signup

        previous_users = User.find_by_email(params[:email])
            
        if previous_users
            render json: { message: "user already exists" }
        else
            @user = User.new(params[:user])
            @user.email = params[:email]
            @user.password = params[:password]
            @user.name = params[:name]
            @user.save
            token = encode_user_data({ user_data: @user.id })
  
            render json: { token: token,user:@user }
      end
    end
  
    def login
        @user = User.find_by_email(params[:email])
  
    if @user && @user.password == params[:password]
  
        token = encode_user_data({ user_data: @user.id })
  
        render json: { token: token,user:@user }
      else
        render json: { message: "invalid credentials" }
      end
    end

    

  end 