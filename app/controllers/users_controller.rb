class UsersController < ApplicationController

	def show
		@userProfile = User.find(params[:id])
	end

end

