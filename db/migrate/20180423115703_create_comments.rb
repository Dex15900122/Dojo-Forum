class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.text :content
      t.integer :article_id
      t.integer :user_id

      t.timestamps
    end
    add_index :comments  ,  [:user_id] 
    add_index :comments  ,  [:article_id]
  end
end
