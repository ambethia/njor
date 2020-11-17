class CreateActionBars < ActiveRecord::Migration[6.0]
  def change
    create_table :action_bars do |t|
      t.references :keymap, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
