require 'open-uri'

class DivisionsController < ApplicationController
	before_action :set_division, only: [:update, :destroy]

	def index
		@divisions = Division.all
		@division = Division.new
	end

	def create
		api_divisions = fetch_division_names
		api_division_names = api_divisions.map { |division| division["name"] }

		@division = Division.new(strong_division_params)

		if api_division_names.include? @division.name
			# do nothing, say it is already included
		else
			@division.save
			# save in way-book
			user_token = session["authentication_token"]
		    current_user_email = current_user.email
		  	api_url = "http://localhost:3000/api/v1/divisions?user_email=#{current_user_email}&user_token=#{user_token}"
			response = HTTParty.post(
				api_url, body: {
					division: @division.to_json
				}
			)
			# binding.pry
			JSON.parse(response.body)
		end
		redirect_to divisions_path
	end

	def update
		@division.update(strong_division_params)

		user_token = session["authentication_token"]
	    current_user_email = current_user.email
	    id = @division.id

	  	api_url = "http://localhost:3000/api/v1/divisions/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"
		response = HTTParty.patch(
			api_url, body: {
					name: @division.name
				}
		)
		redirect_to divisions_path
	end

	def destroy
		user_token = session["authentication_token"]
	    current_user_email = current_user.email
	    id = @division.id

	  	api_url = "http://localhost:3000/api/v1/divisions/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"
		response = HTTParty.delete(
			api_url
		)

		@division.delete
		redirect_to divisions_path
	end

	private

	def fetch_division_names
		user_token = session["authentication_token"]
	    current_user_email = current_user.email
	  	url = "http://localhost:3000/api/v1/divisions?user_email=#{current_user_email}&user_token=#{user_token}"

	  	html_file = open(url).read
	  	json_response = JSON.parse(html_file)
	end

	def set_division
		@division = Division.find(params[:id].to_i)
	end

	def strong_division_params
		params.require(:division).permit(:name)
	end

end
