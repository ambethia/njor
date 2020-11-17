class CreatePlayableClasses < ActiveRecord::Migration[6.0]
  def change
    create_table :playable_classes do |t|
      t.string :name
      t.string :color

      t.timestamps
    end
  end
end
