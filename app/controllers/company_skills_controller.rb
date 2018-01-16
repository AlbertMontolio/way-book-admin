class CompanySkillsController < ApplicationController
	before_action :set_company_skill, only: [:update, :destroy]

	def create
		category = Category.find(params[:category_id].to_i)
		company_skill = CompanySkill.new(strong_company_skill_params)
		company_skill.category = category
		company_skill.save

		division = company_skill.category.division

		redirect_to edit_division_path(division)
	end

	def update
		@company_skill.update(strong_company_skill_params)

		division = @company_skill.category.division

		redirect_to edit_division_path(division)
	end

	def destroy
		division = @company_skill.category.division
		@company_skill.destroy

		redirect_to edit_division_path(division)
	end

	private

	def set_company_skill
		@company_skill = CompanySkill.find(params[:id].to_i)
	end

	def strong_company_skill_params
		params.require(:company_skill).permit(:name)
	end
end
