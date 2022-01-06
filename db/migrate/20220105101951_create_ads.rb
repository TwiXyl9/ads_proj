class CreateAds < ActiveRecord::Migration[7.0]
  def change
    create_table :ads do |t|
      t.string :name
      t.text :description
      t.integer :stage
      t.string :photos, array: true, default: []
      t.references :tag,  foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
