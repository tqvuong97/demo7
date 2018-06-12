module CommentsHelper
	def comments_tree_for comments, article, comment_new
    safe_join(comments.map do |comment, nested_comments|
      render(comment, article: article,
        comment_new: comment_new) + tree(nested_comments, article)
    end)
  end

  def tree nested_comments, article
    unless nested_comments.empty?
      content_tag :div,
        comments_tree_for(nested_comments, article, Comment.new), class: "replies"
    end
  end
end
