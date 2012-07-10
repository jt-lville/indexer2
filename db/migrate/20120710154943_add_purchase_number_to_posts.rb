class AddPurchaseNumberToPosts < ActiveRecord::Migration
  def change
	  
    add_column :posts, :purchase_number, :string

  end
end
