class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :category
      t.string :title
      t.string :subtitle
      t.text :content
      t.string :publish_link
      t.string :article_link
      t.timestamps
    end
  end
end
