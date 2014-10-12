class UpdatePriceOnRemix < ActiveRecord::Migration
  def change
    
    remove_column :remixes, :price
    add_column :remixes, :price, :decimal, default: 10
  end
end
