class ArticlesController < ApplicationController
  before_action :authenticate_user! , except: [:index]
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all.order(id: :desc)
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
    @comment = Comment.new
    @comment = @article.comments
    @reply = @article.replies.new
    # @reply = @article.comments.replies
    
  end

  # GET /articles/new
  def new
    @article = Article.new

    @article.uploader = current_user.username

    #current_user.username
  end

  # GET /articles/1/edit
  def edit
    
  end

  # POST /articles
  # POST /articles.json
  def create
    @article = Article.new(article_params)
    
@article.uploader = current_user.username
    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
   if @article.uploader != current_user.username
    return render :show
    else @article.update(article_params)
          render :edit
   end  
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    if @article.uploader == current_user.username
      @article.destroy
      respond_to do |format|
        format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
