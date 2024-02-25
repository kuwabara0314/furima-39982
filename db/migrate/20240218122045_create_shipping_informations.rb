class CreateShippingInformations < ActiveRecord::Migration[7.0]
  def change
    create_table :shipping_informations do |t|
      t.string :postcode,          null: false
      t.integer :prefecture_id,    null: false
      t.string :municipalities,    null: false
      t.string :block,             null: false
      t.string :building
      t.string :phone_number,      null: false
      t.references :buy,           null: false, foreign_key: true

      t.timestamps
    end
  end
end
