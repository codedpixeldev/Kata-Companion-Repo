class CreateKatas < ActiveRecord::Migration
  def change
    create_table :katas do |t|
      t.string :title
      t.string :url
      t.string :movements

      t.timestamps null: false
    end
  end
end
