module ArticlesHelper
  def check_user_voted(article_id)
    @user_vote.grep(article_id).count.zero?
  end

  def sort_list
    if params[:order]
      articles_path
    else
      articles_path(:order => true)
    end
  end
end

