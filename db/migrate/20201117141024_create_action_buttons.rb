class CreateActionButtons < ActiveRecord::Migration[6.0]
  def change
    create_table :action_buttons do |t|
      t.references :action_bar, null: false, foreign_key: true
      t.references :category, null: true, foreign_key: true
      t.integer :slot
      t.string :hotkey
      t.timestamps
    end
  end
end
