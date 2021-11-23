class UsersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource only: :show
    
    def index
      @users = User.all
    end

    def destroy
      @user.destroy
      redirect_to users_path
    end
end