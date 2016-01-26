class UsersController < ApplicationController



def index
	@users = User.paginate(page: params[:page], per_page: 5)
	
end

def new
		
	@user = User.new

end

def create
	@user = User.new(super_params)
	if @user.save
		redirect_to articles_path
		flash[:success] = "Welcome to the awesome blog!"
	else
		render 'new'
	end
end

def edit
	
end

def update
	if @user.update(super_params)
		redirect_to articles_path
		flash[:success] = "Udało Ci się zmienić swoje dane!"
	else
		render "edit"
		flash[:danger] = "Udało Ci się coś zjebać!"
	end
end

def show
	
end

private

def super_params
	params.require(:user).permit(:username, :email, :password)
end

def set_user
	@user = User.find( params[:id] ) 
	
end
def set_same_user
	if logged_in? && @user == current_user
	else
	flash[:danger] = "You are not allowed to do this action"
	redirect_to root_path
	end
end

end
