class CreateRemixes < ActiveRecord::Migration
  def change
    create_table :remixes do |t|
      t.string :title
      t.belongs_to :user, index: true
      t.string :price, default: 10
      t.string :image
      t.integer :original_id
      t.boolean :original_mix, default: true

      t.timestamps
    end
    
    add_index :remixes, :original_id
  end
end
