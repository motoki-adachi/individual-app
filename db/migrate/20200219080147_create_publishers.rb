class CreatePublishers < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :publisher, null: false, unique: true
      t.timestamps
    end
  end
end
