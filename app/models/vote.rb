class Vote < ActiveRecord::Base
  validates :user_identity, :uniqueness => true
  
  belongs_to :article
  
protected
  def self.user_vote(user_ip)
    self.where("user_ip = ?", user_ip).map{|el| el.article_id}
  end
end
