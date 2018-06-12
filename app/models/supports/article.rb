class Supports::Article
  attr_reader :article, :articles

  def initialize article
    @article = article
  end

  def articles
    @articles ||= article.all
  end

  def comment
    @comment = Comment.new
  end

  def comments_tree
    @comments = @article.comments
  end
end