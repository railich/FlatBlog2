class Article < ActiveRecord::Base
  validates :title, :body, :presence => true

  belongs_to :category
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  scope :above_a_certain_rating, lambda{|minimum_rating| where('rating > ?',minimum_rating).order ('DATE(created_at) DESC, rating DESC')}
  scope :below_a_certain_rating, lambda{|minimum_rating| where('rating <= ?',minimum_rating).order('DATE(created_at) DESC, rating DESC')}
end

