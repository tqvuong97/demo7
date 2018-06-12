class Article < ApplicationRecord
	 has_many :comments 
	 has_many :replies
	# has_many :comments, as: :commentable
end
