class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :content
      t.integer :price
      t.integer :status
      t.string :image
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
