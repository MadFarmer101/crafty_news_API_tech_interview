class Api::CommentsController < ApplicationController

  def create
    comment = Comment.create(comment_params)
    if comment.persisted?
      render json: { message: 'Your comment is saved.' }
    else
      render json: { errors: comment.errors }, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
