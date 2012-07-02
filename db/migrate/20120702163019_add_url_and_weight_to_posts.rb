class AddUrlAndWeightToPosts < ActiveRecord::Migration
  def change
	  add_column :posts, :url, :string
	  add_column :posts, :weight, :decimal
  end
end
