class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :title, limit: 255
      t.text :destription
      t.references :category
      t.references :members

      t.timestamps
    end
    add_index :ads, :category_id
    add_index :ads, :members_id
  end
end
