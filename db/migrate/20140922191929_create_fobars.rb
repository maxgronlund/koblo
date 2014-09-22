class CreateFobars < ActiveRecord::Migration
  def change
    create_table :fobars do |t|
      t.string :title

      t.timestamps
    end
  end
end
