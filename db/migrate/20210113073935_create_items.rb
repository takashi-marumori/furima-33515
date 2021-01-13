class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title,              null: false
      t.text :explanation,          null: false
      t.integer :plice,             null: false
      t.integer :category_id,       null: false
      t.integer :item_status_id,    null: false
      t.integer :burden_id,         null: false
      t.integer :prefecture_id,     null: false
      t.integer :day_id,            null: false
      t.references :user,           foreign_key: true
      t.timestamps
    end
  end
end