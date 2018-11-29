class ItemChange < ActiveRecord::Migration[5.2]
  def change
  	change_column :items, :price, :string
  end
end
