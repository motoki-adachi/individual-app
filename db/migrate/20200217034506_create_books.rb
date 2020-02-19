class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name, null: false
      t.integer :author_id, null: false, foreign_key: true
      t.integer :genre_id, null: false, foreign_key: true
      t.integer :publisher_id, null: false, foreign_key: true
      t.timestamps
    end
  end
end
