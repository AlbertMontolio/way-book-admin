class CategoriesController < ApplicationController

	before_action :set_category, only: [:update, :destroy]
	
	def create
		division = Division.find(params[:division_id].to_i)
		@category = Category.new(strong_category_params)
		@category.division = division
		@category.save
		redirect_to edit_division_path(division)
	end

	def update
		@category.update(strong_category_params)
		redirect_to edit_division_path(@category.division)
	end

	def destroy
		@category.destroy
		redirect_to edit_division_path(@category.division)
	end

	private

	def set_category
		@category = Category.find(params[:id].to_i)
	end

	def strong_category_params
		params.require(:category).permit(:name)
	end
end
