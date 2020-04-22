class Api::CommentsController < ApplicationController
  before_action :find_article

  def create
    comment = Comment.create(comment_params)
    comment.article_id = params[:article_id]
    if comment.persisted?
      render json: { message: 'Your comment is saved.' }
    else
      render json: { error: "Body can't be blank." }, status: 422
    end
  end

  private

  def find_article
    @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:body, :article_id)
  end
end
