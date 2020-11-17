class CreateAbilities < ActiveRecord::Migration[6.0]
  def change
    create_table :abilities do |t|
      t.references :specialization, null: false, foreign_key: true
      t.references :category, null: true, foreign_key: true
      t.string :name
      t.string :subtext
      t.boolean :is_talent
      t.boolean :is_passive
      t.integer :spell_id

      t.timestamps
    end
  end
end
