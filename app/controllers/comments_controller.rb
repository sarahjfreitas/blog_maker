class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # GET /comments
  def index
    @comments = Comment.where(post_id: params[:post_id]).order('created_at DESC')
  end

  # GET /comments/1
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.post, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.post
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
        redirect_to @comment, notice: 'Comment was successfully updated.'
    else
      render :edit 
    end
  end

  # DELETE /comments/1
  def destroy
    begin
      @comment.destroy
      redirect_to comments_url, notice: 'Comment was successfully destroyed.'
    rescue
      redirect_to comments_url, alert: 'Comment was not successfully destroyed.'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      p = params.require(:comment).permit(:name, :body, :post_id).merge(post_id: params[:post_id])
    end
end
