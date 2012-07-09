class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.string :feed_preference
      t.references :user

      t.timestamps
    end
    add_index :preferences, :user_id
  end
end
