class Comment < ActiveRecord::Base
  validates :name, :body, :presence => true

  belongs_to :article
  scape :get_comments, lambda{|article_id| where(:article_id => article_id)}
end
