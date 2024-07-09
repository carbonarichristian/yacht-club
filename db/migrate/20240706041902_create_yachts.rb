class CreateYachts < ActiveRecord::Migration[7.1]
  def change
    create_table :yachts do |t|
      t.string :name
      t.string :model
      t.float :price
      t.string :photo

      t.timestamps
    end
  end
end
