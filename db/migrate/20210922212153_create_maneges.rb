class CreateManeges < ActiveRecord::Migration[5.2]
  def change
    create_table :maneges do |t|
      t.string :name
      t.text :post

      t.timestamps
    end
  end
end
