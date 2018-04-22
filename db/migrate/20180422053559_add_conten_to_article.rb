class AddContenToArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :articles, :content , :text
  end
end
