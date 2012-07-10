class AddInfoToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :manufacturer, :string

    add_column :posts, :date_purchased, :string

  end
end
