class PostsController < ApplicationController

	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@posts = Post.all
	end

	def show 
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		if @post.save
			redirect_to @post, info: 'Post has been created'
		else
			flash[:danger] = 'Post has not been created'
			render :new
		end
	end	

	def edit
		@post = Post.find(params[:id])
	end

	def update 
		if @post.update_attributes(post_params)
			redirect_to @post, info: 'Post has been updated'
		else
			flash[:danger] = 'Post has not been updated'
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path, info: 'Post has been deleted'
	end

	private
		def post_params
			params.require(:post).permit(:title, :summary, :body, :image)
		end

		def set_post
			@post = Post.find(params[:id])
		end

end
