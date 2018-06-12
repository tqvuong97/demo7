class RepliesController < ApplicationController
	before_action do
   
    @article = Article.find(params[:article_id])
  end

  # def index
  #  @reply = @article.comments.replies.new
  #   @replies = @article.comments.replies.new
  #   @replies = @article.comments.replies

  # end

  def new
     @comment = Comment.find(params[:comment_id])
    @reply = @comment.replies.new

    @comment.replies.user_id = current_user.id
    @comment.replies.article_id = @comment.article_id
  end

  def create
    @reply = @article.replies.create(reply_params)
    @reply = @article.replies.new(reply_params)          
            @reply.user = current_user
            @reply.save
            redirect_to @article
  end
  def destroy
    @article = Article.find(params[:article_id])
        @reply = @article.replies.find(params[:id])
        if @reply.user_id == current_user.id
        @reply.destroy
        
        else
          flash[:danger] = "Not owned by user!"
          # render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
        end
        redirect_to article_path(@article)
    
  end
  private
    def reply_params
      params.require(:reply).permit(:comment_id, :user_id,:content)
    end
end
