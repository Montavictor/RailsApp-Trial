module ArticlesHelper
  def form_title(article)
    article.new_record? ? "Create Article" : "Edit Article"
  end

  def form_link(article)
    article.new_record? ? articles_path : article_path(article)
  end

  def form_back_text(article)
    article.new_record? ? "Back to Articles" : "Cancel"  
  end

  def article_time(time_created)
    distance_of_time_in_words(time_created, Time.current)
  end
end