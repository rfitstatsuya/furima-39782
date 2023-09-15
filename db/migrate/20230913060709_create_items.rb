class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string     :name,             null: false
      t.text       :explanation,      null: false
      t.integer    :category_id,      null: false
      t.integer    :condition_id,     null: false
      t.integer    :derivery_cost_id, null: false
      t.integer    :prefecture_id,    null: false
      t.integer    :sending_date_id,  null: false
      t.integer    :price,            null: false, format: { with: /\A [0-9]+ \z/ }
      t.references :user,             null: false, foreign_key: true
      t.timestamps
    end
  end
end
