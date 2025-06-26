module CommentsHelper
  def comment_time(time_created)
    distance_of_time_in_words(time_created, Time.current)
  end
end
