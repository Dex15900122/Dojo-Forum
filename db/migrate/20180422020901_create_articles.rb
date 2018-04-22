class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.integer :replies_count
      t.integer :viewed_count
      t.text :image
      t.integer :status , default: 0
      t.timestamps
    end
  end
end
