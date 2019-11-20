class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title, limit: 255
      t.text :description
      t.references :category
      t.references :member

      t.timestamps
    end
    add_index :ads, :category_id
    add_index :ads, :member_id
  end
end
