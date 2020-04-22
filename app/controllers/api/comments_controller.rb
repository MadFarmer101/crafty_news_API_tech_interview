class Api::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_existance_of_article_and_user

  def create
    comment = Comment.create(comment_params)
    if comment.persisted?
      render json: { message: "Your comment is saved." }
    else
      render json: { error: "Body can't be blank." }, status: 422
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :article_id, :user_id)
  end

  def verify_existance_of_article_and_user
    if comment_params['article_id'].nil? || comment_params['user_id'].nil?
      render json: { error: "Internal error." }, status: 500
    end
  end
end
