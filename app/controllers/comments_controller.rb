module API
	class CommentsController < ApplicationController
		respond_to :json

	  def index
	  	comments = Comment.all

	  	respond_with comments
	  end

	  def show
	  	comment = Comment.find(params[:id])

	  	respond_with comments
	  end

	  def create
	  	comment = Comment.new(comment_params)

	  	if comment.save
	  		respond_with comment, location: [:api, comment]
	  	else
	  		respond_with comment
	  	end
	  end

	  def update
	  	comment = Comment.find(params[:id])

	  	if comment.update_attributes(comment_params)
	  		head 204
	  	else
	  		respond_with comment
	  	end
	  end

	  def destroy
	  	comment = Comment.find(params[:id])
	  	comment.destroy
	  	head 204
	  end



	  private

	  def comment_params
	  	params.require(:comment).permit(:link, :title)
	  end

	end
end