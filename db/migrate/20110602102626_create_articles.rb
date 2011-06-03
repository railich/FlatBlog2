class CreateArticles < ActiveRecord::Migration
  def self.up
    create_table :articles do |t|
      t.integer :category_id
      t.string :title
      t.text :body
      t.string :url
      t.string :tags
      t.integer :rating, :default => 0

      t.date :created_at
      t.datetime :updated_at
    end
  end

  def self.down
    drop_table :articles
  end
end
