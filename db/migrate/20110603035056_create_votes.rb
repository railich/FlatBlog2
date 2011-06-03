class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :article_id
      t.string :user_ip
      t.string :user_identity

      t.timestamps
    end
  end

  def self.down
    drop_table :votes
  end
end
