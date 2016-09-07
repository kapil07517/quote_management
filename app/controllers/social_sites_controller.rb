class SocialSitesController < ApplicationController

	def create
		@user = User.from_omniauth(env["omniauth.auth"])
		sign_in :user, @user
		redirect_to root_path
	end
end
