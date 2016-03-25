class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name, null: false
      t.string :url, null: false
      t.integer :ranking, null: false
      t.text :description

      t.timestamps null: false
    end
  end
end
