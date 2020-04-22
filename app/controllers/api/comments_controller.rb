class Api::CommentsController < ApplicationController
  before_action :find_article!

  def create
    comment = @article.comments.new(comment_params)
    if comment.persisted?
      render json: { message: 'Your comment is saved.' }
    else
      render json: { errors: comment.errors }, status: 422
    end
  end

  private

  def find_article!
    @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
