class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :avatar, AvatarUploader

	cattr_accessor :form_steps do
    %w(add_title add_body add_conclusion)
  end
  
  attr_accessor :form_step 

  validates :title, :content, presence: true, if: -> { required_for_step?(:add_title) }
  validates :body, presence: true, if: -> { required_for_step?(:add_body) }
  validates :conclusion,:aboutauthor, presence: true, if: -> { required_for_step?(:add_conclusion) }
  

  def required_for_step? step
    return true if self.form_steps.index(step.to_s) == self.form_steps.index(form_step)
  end
  # def previous_step
  #   self.current_step = steps[steps.index(current_step)-1]
  # end


  # attr_writer :current_stepp
  # def current_stepp
  #   @current_stepp || steps.first
  # end

  # def steps
  #   %w(add_title add_body add_conclusion)
  # end

  # def next_step
  #   self.current_stepp = steps[steps.index(current_stepp)+1]
  # end

  # def previous_step
  #   self.current_stepp = steps[steps.index(current_stepp)-1]
  # end

  # def first_step?
  #   current_stepp == steps.first
  # end

  # def last_step?
  #   current_stepp == steps.last
  # end
  # def all_valid?
  #   steps.all? do |step|
  #     self.current_stepp = step
  #     valid?
  #   end
  # end
end
