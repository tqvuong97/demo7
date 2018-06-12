class Post::StepsController < ApplicationController
	 include Wicked::Wizard
  steps *Post.form_steps

  def show
    @post = Post.find(params[:post_id])
    render_wizard
  end


  def update
    #debugger
    @post = Post.find(params[:post_id])
    @post.update_attributes(post_params(step))

    if params[:commit] == 'save'
      saveDataAndStep @post
      render_wizard
    elsif params[:commit] == 'next'
      @post.current_step = next_step.to_s
      @post.save
      render_wizard @post      
    elsif params[:commit]=='Publish'
      @post.ispublish = 1
      @post.current_step = nil
      @post.save
      redirect_to post_path @post 
    elsif params[:commit]== 'back'
      @post.current_step = previous_step.to_s
      @post.save
      redirect_to previous_wizard_path 
    end  
  end

  private
  def post_params(step)
  	permitted_attributes = case step
                           when "add_title"
                             [:title,:content]
                          
                           when "add_body"
                             [:avatar,:body]

                          when "add_conclusion"

                             [:conclusion,:aboutauthor]
                             
                           end
    params.require(:post).permit(permitted_attributes).merge(form_step: step)
  end
  def saveDataAndStep p
      p.current_step = step.to_s
      p.save
  end
end
