class CreatePromoCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :promo_codes do |t|
      t.string :code, null: false

      t.timestamps
    end
  end
end
