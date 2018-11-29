class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url
      t.belongs_to :panier, index: true
      t.belongs_to :order, index: true
      t.timestamps
    end
  end
end
