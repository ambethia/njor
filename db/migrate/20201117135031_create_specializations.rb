class CreateSpecializations < ActiveRecord::Migration[6.0]
  def change
    create_table :specializations do |t|
      t.references :playable_class, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
