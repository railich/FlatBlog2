module ArticlesHelper
  def check_user_voted(article_id)
    @user_vote.grep(article_id).count.zero?
  end
end
