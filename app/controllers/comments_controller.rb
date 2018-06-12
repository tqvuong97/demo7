class CommentsController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  
  # before_action :set_comment, only: [:show, :edit, :update, :destroy]
	def new
		@comment = Comment.new(parent_id: params[:parent_id])
		@article.comments.user_id = current_user.id

		 
	end
	def index
    @comment = Comment.new
		@comments = @article.comments.order(created_at: :desc)

	end
  def show

    
  end
	 def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
 	  @comment = @article.comments.new(comment_params)
    @comment.user = current_user    
    render json: { errors: @comment.errors }, status: :unprocessable_entity unless @comment.save
    redirect_to article_path(@article)
  end
  def destroy
    @article = Article.find(params[:article_id])
        @comment = @article.comments.find(params[:id])
        if @comment.user_id == current_user.id || @article.uploader == current_user.username
        @comment.destroy
        
        else
          flash[:danger] = "Not owned by user!"
          # render json: { errors: { comment: ['not owned by user'] } }, status: :forbidden
        end
        redirect_to article_path(@article)
      
  end
 

	 private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:parent_id,:content)
    end
    
end
