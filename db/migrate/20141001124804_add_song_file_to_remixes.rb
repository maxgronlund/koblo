class AddSongFileToRemixes < ActiveRecord::Migration
  def change
    add_column :remixes, :song_file, :string
  end
end
