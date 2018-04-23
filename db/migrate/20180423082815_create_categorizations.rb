class CreateCategorizations < ActiveRecord::Migration[5.1]
  def change
    create_table :categorizations do |t|
      t.integer :category_id
      t.integer :article_id

      t.timestamps
    end
    add_index :categorizations  ,  [:category_id] 
    add_index :categorizations  ,  [:article_id]
  end
end
