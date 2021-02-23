class CreateTies < ActiveRecord::Migration[6.0]
  def change
    create_table :ties do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.float :price_per_day
      t.string :picture

      t.timestamps
    end
  end
end
