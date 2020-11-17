class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :main
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
