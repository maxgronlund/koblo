class RecreateRemixThumbVersions < ActiveRecord::Migration
  def change
    Remix.find_each do |remix|
      remix.image.recreate_versions!
      remix.save!
    end
  end
end
