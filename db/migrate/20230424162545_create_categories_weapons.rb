class CreateCategoriesWeapons < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_weapons do |t|
      t.references :category, null: false, foreign_key: true
      t.references :weapon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
