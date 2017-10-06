class UsersController < ApplicationController
  def index
		@users = User.all
  end
	def create
		GenerateRandomUserJob.perform_later
		#GenerateRandomUserJob.set(wait: 2.minutes).perform_later
		#@user = User.new
		#@user.first_name = Faker::Name.first_name
		#@user.last_name = Faker::Name.last_name
		#@user.email = Faker::Internet.email

		#
		#@user.save!
		#sleep 2
		redirect_to root_path
	end
	def destroy_all
		User.all.destroy_all
		redirect_to root_path
	end
end
