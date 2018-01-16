require 'open-uri'

class DivisionsController < ApplicationController
	before_action :set_division, only: [:update, :destroy]

	def index
		@divisions = Division.all
		@division = Division.new
	end

	def edit
		id = params[:id].to_i
		@division = Division.find(id)

		@category = Category.new
		@company_skill = CompanySkill.new
	end

	def create
		@division = Division.new(strong_division_params)
		@division.save
		redirect_to divisions_path
	end

	def update
		@division.update(strong_division_params)
		redirect_to edit_division_path(@division)
	end

	def destroy
		@division.delete
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
