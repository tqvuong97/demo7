class PostsController < ApplicationController
# @@current_step = 0 
   # before_action :authenticate_user! , except: [:index]
  before_action :set_post, only: [ :show ,:edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
   
    @posts = Post.all
  
  end
  def another_index
    @posts = Post.all
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    
  end

  # GET /posts/new
  def new
  	@post = Post.new

    # render partial: 'steps/add_title'
  end

  # GET /posts/1/edit
  def edit

  end
  
  def create
    @post = Post.new

    @post.user_id = current_user.id
    @post.save validate: false
    @post.ispublish = 0
    redirect_to post_step_path(@post, Post.form_steps.first)

  
    # @post = Post.new(post_params)
    
    # @post.user_id = current_user.id
    # if params[:commit] == 'next'
    #   @@current_step = @@current_step + 1
    #   @post.current_step = @@current_step.to_s
    #   @post.save
    #   render partial: 'steps/add_body'
    # end
    # if params[:commit] == 'save'
    #    @post.current_step = '0'
    #       @post.save
    #       render partial: 'steps/add_title'
     
    # end

    
  end

	 
  def update
    # if params[:commit] == 'next'
      
    #   @@current_step = @@current_step + 1
    #   @post.current_step = @@current_step.to_s
    #   @post.update post_params
    #   render partial: 'steps/add_conclusion'

    # end
    # if params[:commit]== 'Publish'
    #   @@current_step = nil
    #   @post.ispublish = 1
    #   @post.current_step = @@current_step.to_s
    #   @post.update post_params
    #   redirect_to post_path @post 

    # end
    # if params[:commit] == 'save'
    #   if @post.current_step == '0'
    #     @post.update post_params
    #       render partial: 'steps/add_title'
        
    #   elsif @post.current_step == '1'
    #     @post.update post_params
    #       render partial: 'steps/add_body'
        
    #   elsif @post.current_step == '2' 
    #      @post.update post_params
    #       render partial: 'steps/add_conclusion'
        
    #   end
      
    # end

    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title ,:content ,:avatar,:body,:conclusion,:aboutauthor,:user_id,:current_step)
    end
end
