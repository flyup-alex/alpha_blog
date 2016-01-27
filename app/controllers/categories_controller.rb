class CategoriesController < ApplicationController

	before_action :set_same_user, except: [:index, :new]

def index
	@categories = Category.paginate(page: params[:page], per_page: 5)
end

def new

	@category = Category.new
	
end

def show

	@category = Category.find(params[:id])
	
end

def create
	@category = Category.new(category_params)
	if @category.save
		flash[:success] = "You have created the new category"
		redirect_to categories_path

	else
		render 'new'
	end
end

def edit
	
	
end

def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:success] = "Category has been succesfuly updated!"
		redirect_to category_path(@category)

		else
			render 'edit'
		end
	end


private

def category_params

	params.require(:category).permit(:name)

end

def set_same_user
	if !logged_in? && @user != current_user
	flash[:danger] = "You are not allowed to do this action"
	redirect_to root_path
	end
end

end