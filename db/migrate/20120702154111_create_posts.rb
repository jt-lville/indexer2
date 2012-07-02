class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      
      t.string :name
      t.text :description
      t.string :location
      t.decimal :cost
      t.string :size
      t.decimal :weight

      t.string :category #e.g. electronics, books, etc
      t.string :owner
      
      t.timestamps
    end
  end
end
