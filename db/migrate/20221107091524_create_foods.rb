class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :description
      t.string :dish
      t.string :fruits

      t.timestamps
    end
  end
end
