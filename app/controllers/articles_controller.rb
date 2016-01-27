class ArticlesController < ApplicationController

before_action :set_article, only: [:edit, :update, :show, :destroy ]
before_action :require_user, except: [:index, :show ]
before_action :require_same_user, except: [:index, :show, :new, :create]


	def index
		@articles = Article.paginate(page: params[:page], per_page: 5).order('id DESC')
	end


	def new

		@article = Article.new(user_id: current_user.id)
		flash[:success] = "Please add a new article."
	end


	def edit
	
	end


	def update
		
		if @article.update(super_params )
			flash[:success] = "Article has been succesfuly updated!"
		redirect_to article_path(@article)

		else
			render 'edit'
		end
	end


	def create
		#render plain: params[:article].inspect

		@article = Article.new(super_params)
		@article.user = User.find_by( username: current_user.username)
		if @article.save
			flash[:success] = "Article has been created"
		redirect_to article_path(@article)

		else
			render 'new'
		end

	end
	

	def show
	
		
	end

	def destroy

		if @article.destroy
			flash[:danger] = "Article has been destroied"
		redirect_to articles_path
		end
	end

	private
	def super_params
		params.require(:article).permit(:title, :description, :owner, :user_id, category_ids: [])
	end
	
	def set_article
		@article = Article.find( params[:id] )
		
	end

	def require_same_user
		if current_user == @article.user
		else
			flash[:danger] = "You need to be this user to perform this action."
			redirect_to root_path
		end
	end
	
end
