class AddRemixerToRemixes < ActiveRecord::Migration
  def change
    add_column :remixes, :remixer, :string, default: ''
    add_column :remixes, :track_count, :integer, default: 8
  end
end
