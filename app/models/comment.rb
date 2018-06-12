class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article
  # acts_as_tree order: "created_at ASC"
  # acts_as_tree order: 'created_at DESC'
# has_many :comments
  # belongs_to :commentable, :polymorphic => true
  # has_many :comments, :as => :commentable
  
  has_many :replies

end
