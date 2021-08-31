class CreateTalks < ActiveRecord::Migration[5.2]
  def change
    create_table :talks do |t|
      t.string :name
      t.text :post

      t.timestamps
    end
  end
end
