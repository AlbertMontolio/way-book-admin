require 'open-uri'

class DivisionsController < ApplicationController
	before_action :set_division, only: [:update, :destroy]

	def index
		@user_token = session["authentication_token"]
		current_user_email = current_user.email

		url = "http://localhost:3000/api/v1/divisions?user_email=#{current_user_email}&user_token=#{@user_token}"

		html_file = open(url).read
		@divisions = JSON.parse(html_file)

		@division = Division.new
	end

	def update_api
		id = params["id"]
		name = params["name"]

		user_token = session["authentication_token"]
		current_user_email = current_user.email

		api_url = "http://localhost:3000/api/v1/divisions/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.patch(
			api_url, body: {
				division: {
					id: id, name: name
				}
			}
		)
		JSON.parse(response.body)

		redirect_to divisions_path
	end
	
	private
	def set_division
		@division = Division.find(params[:id].to_i)
	end

	def strong_division_params
		params.require(:division).permit(:name)
	end

end
