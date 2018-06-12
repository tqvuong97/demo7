class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :article
 belongs_to :comment
  # has_many :comments, as: :commentable
end
