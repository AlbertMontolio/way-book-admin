class CompanySkillsController < ApplicationController
	before_action :set_company_skill, only: [:update, :destroy]

	def new_api
		category_id = params["category_id"]
		name = params["name"]

		user_token = session["authentication_token"]
		current_user_email = current_user.email

		api_url = "http://localhost:3000/api/v1/company_skills/?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.post(
			api_url, body: {
				company_skill: {
					category_id: category_id, 
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

		api_url = "http://localhost:3000/api/v1/company_skills/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.patch(
			api_url, body: {
				company_skill: {
					id: id,
					name: name
				}
			}
		)
		redirect_to divisions_path
	end

	def destroy_api
		id = params["id"]

		user_token = session["authentication_token"]
		current_user_email = current_user.email

		api_url = "http://localhost:3000/api/v1/company_skills/#{id}?user_email=#{current_user_email}&user_token=#{user_token}"

		response = HTTParty.delete(
			api_url, body: {
				company_skill: {
					id: id,
				}
			}
		)
		redirect_to divisions_path		
	end

	private

	def set_company_skill
		@company_skill = CompanySkill.find(params[:id].to_i)
	end

	def strong_company_skill_params
		params.require(:company_skill).permit(:name)
	end
end
