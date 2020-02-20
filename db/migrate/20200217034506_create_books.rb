class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title, null: false
      t.string :image
      t.integer :author_id, null: false, foreign_key: true
      t.integer :genre_id, null: false, foreign_key: true
      t.integer :publisher_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
