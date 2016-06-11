class AddMovementLinksToKata < ActiveRecord::Migration
  def change
    add_column :katas, :movement_links, :string
  end
end
