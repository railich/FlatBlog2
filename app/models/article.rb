class Article < ActiveRecord::Base
  validates :title, :body, :presence => true

  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  scope :above_a_certain_rating, lambda{|minimum_rating| where('rating > ?',minimum_rating).order('DATE(created_at) DESC, rating DESC').includes(:comments)}
  scope :below_a_certain_rating, lambda{|minimum_rating| where('rating <= ?',minimum_rating).order('DATE(created_at) DESC, rating DESC').includes(:comments)}

  CATEGORY = ['News', 'Sport', 'Humor', 'World']
  
  def vote!(user_ip)
    self.votes.create!(:user_ip => user_ip, :user_identity => (self.id.to_s + '#' + user_ip.to_s))
  end
end

