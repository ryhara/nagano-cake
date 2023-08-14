class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.text :description
      t.integer :non_taxed_price
      t.boolean :is_selling, defalut: true
      t.timestamps
    end
  end
end
