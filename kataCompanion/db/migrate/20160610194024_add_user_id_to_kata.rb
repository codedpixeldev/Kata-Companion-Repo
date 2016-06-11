class AddUserIdToKata < ActiveRecord::Migration
  def change
    add_column :katas, :user_id, :integer
  end
end
