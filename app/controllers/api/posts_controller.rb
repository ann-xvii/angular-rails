module API
	class PostsController < ApplicationController
	  respond_to :json
	  
	  def index
	  	posts = Post.all

	  	respond_with posts
	  end

	  def show
	  	post = Post.find(params[:id])

	  	respond_with post
	  end

	  def create
	  	post = Post.new(post_params)

	  	if post.save
	  		respond_with post, location: [:api, post]
	  	else
	  		respond_with post
	  	end
	  end


	  def update
	  	post = Post.find(params[:id])
	  	if post.update_attributes(post_params)
	  		head 204
	  	else
	  		respond_with post
	  	end
	  end



	  def destroy
	  	post = Post.find(params[:id])
	  	post.destroy
	  	head 204
	  end


	  private 

	  def post_params
	  	params.require(:post).permit(:link, :title)
	  end

	end
end