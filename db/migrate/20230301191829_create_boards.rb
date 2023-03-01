class CreateBoards < ActiveRecord::Migration[7.0]
  def change
    create_table :boards do |t|
      t.float :price
      t.integer :rating
      t.string :title
      t.string :category
      t.integer :player_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
