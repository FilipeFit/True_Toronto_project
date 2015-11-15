class ChangePostLimits < ActiveRecord::Migration
  def change
    change_column(:posts, :title, :string, limit: 40)
    change_column(:posts, :content, :string, limit: 10000)
  end
end