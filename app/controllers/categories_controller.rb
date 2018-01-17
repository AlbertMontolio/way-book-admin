class CategoriesController < ApplicationController

	before_action :set_category, only: [:update, :destroy]
	
	def new_api
		division_id = params["division_id"]
		name = params["name"]

		user_token = session["authentication_token"]
		current_user_email = current_user.email

		api_url = "http://localhost:3000/api/v1/categories/?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.post(
			api_url, body: {
				category: {
					division_id: division_id, 
					name: name
				}
			}
		)

		redirect_to divisions_path
	end

	def update_api
		id = params["id"]
		name = params["name"]

		user_token = session["authentication_token"]
		current_user_email = current_user.email

		api_url = "http://localhost:3000/api/v1/categories/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.patch(
			api_url, body: {
				category: {
					id: id, name: name
				}
			}
		)
		JSON.parse(response.body)

		redirect_to divisions_path
	end

	def destroy_api
		id = params["id"]

		user_token = session["authentication_token"]
		current_user_email = current_user.email

		api_url = "http://localhost:3000/api/v1/categories/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.delete(
			api_url, body: {
				category: {
					id: id
				}
			}
		)
		JSON.parse(response.body)

		redirect_to divisions_path
	end



	private

	def set_category
		@category = Category.find(params[:id].to_i)
	end

	def strong_category_params
		params.require(:category).permit(:name)
	end
end
