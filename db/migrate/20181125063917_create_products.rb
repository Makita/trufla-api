class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.references :department, foreign_key: true
      t.references :promo_code, foreign_key: true

      t.timestamps
    end
  end
end
