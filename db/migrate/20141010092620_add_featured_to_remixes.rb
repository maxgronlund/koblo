class AddFeaturedToRemixes < ActiveRecord::Migration
  def change
    add_column :remixes, :featured, :boolean, default: false
    
    Remix.all.each do |remix|
      
      if remix.original_mix
        remix.featured = true
        remix.save!
      end
      
    end
  end
end
