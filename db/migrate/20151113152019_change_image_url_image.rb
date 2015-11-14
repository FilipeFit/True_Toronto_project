class ChangeImageUrlImage < ActiveRecord::Migration
  def change
    rename_column :posts, :image_url, :image
  end
end
