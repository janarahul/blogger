class ArticlesController < ApplicationController
	include ArticlesHelper
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
	end

	'''def create #this is not a good way
		@article = Article.new
		@article.title = params[:article][:title]
		@article.body = params[:article][:body] #instead do @article = Article.new(params[:article])
		@article.save
		redirect_to article_path(@article)
	end
	'''
	def create
		@article = Article.new(article_params)
		@article.save
		flash.notice = "Article #{@article.title} created"
		redirect_to article_path(@article)
	end

	def destroy
		Article.find(params[:id]).destroy
		flash.notice = "Article destroyed "
		redirect_to articles_path
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])
		@article.update(article_params) #no need save
		flash.notice = "Article #{@article.title} updated" #as it is redirected to show action(as used many times) add it to layout
		redirect_to article_path(@article) #to show
	end
end
