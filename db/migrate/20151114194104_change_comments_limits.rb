class ChangeCommentsLimits < ActiveRecord::Migration
  def change
    change_column(:comments, :body, :text, limit: 500)
  end
end
