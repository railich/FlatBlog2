class Article < ActiveRecord::Base
  validates :title, :body, :presence => true
  
  belongs_to :category
  has_many :comments, :dependent => :destroy
end
