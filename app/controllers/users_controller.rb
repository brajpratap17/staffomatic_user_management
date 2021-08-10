class UsersController < ApplicationController
  def index
		@users = User.filter(params)
		render jsonapi: @users
  end

  def archive
  	user = User.find_by(email: user_params[:email])
  	if user
  		response = user.mark_archive(current_user: current_user, archived: user_params[:archived])
  		render json: response
  	else
			render json: { error: "Can't find User" }
		end
  end

  private

  def user_params
    params.require(:user).permit(:archived, :email)
  end
end
