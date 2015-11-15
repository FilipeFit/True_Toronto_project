class ChangeUsersLimit < ActiveRecord::Migration
  def change
    change_column(:users, :email, :string, limit: 250)
    change_column(:users, :username, :string, limit: 70)
  end
end