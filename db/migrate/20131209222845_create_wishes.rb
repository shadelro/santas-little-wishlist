class CreateWishes < ActiveRecord::Migration
  def change
    create_table :wishes do |t|
      t.string :name
      t.string :description
      t.boolean :bought
      t.integer :wishlist_id
      t.integer :user_id

      t.timestamps
    end
  end
end
