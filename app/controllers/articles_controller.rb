class ArticlesController < ApplicationController

	def index
		@article1 = Article.all
	end


	def new

		@article = Article.new
		
	end


	def edit
		@article = Article.find( params[:id] )
	end


	def update
		@article = Article.find( params[:id] )
		if @article.update(super_params)
			flash[:notice] = "Article has been succesfuly updated!"
		redirect_to article_path(@article)

		else
			render 'edit'
		end
	end


	def create
		#render plain: params[:article].inspect
		@article = Article.new(super_params)
		if @article.save
			flash[:notice] = "Article has been created"
		redirect_to article_path(@article)

		else
			render 'new'
		end

	end
	

	def show
		@article = Article.find( params[:id] )
		
	end

	def destroy
		@article = Article.find( params[:id] )
		@article.destroy
		redirect_to articles_path
	end

	private
	def super_params
		params.require(:article).permit(:title, :description, :owner)
	end
	

	
end
