class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.post
    end
  end

  private
  
  def comment_params
    p = params.require(:comment).permit(:name, :body, :post_id).merge(post_id: params[:post_id])
  end
end
