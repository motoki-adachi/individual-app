class AddGenreToRegisters < ActiveRecord::Migration[5.2]
  def change
    add_reference :registers, :genre, foreign_key: true
  end
end
