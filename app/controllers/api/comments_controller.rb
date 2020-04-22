class Api::CommentsController < ApplicationController
  before_action :find_article

  def create
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end
end
