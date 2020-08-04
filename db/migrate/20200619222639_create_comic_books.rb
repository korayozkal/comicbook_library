class CreateComicBooks < ActiveRecord::Migration
  def change
    create_table :comic_books do |t|
      t.string :title
      t.integer :number
      t.string :publisher
      t.string :artist 
      t.string :writer
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
