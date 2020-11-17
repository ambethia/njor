class CreateKeybinds < ActiveRecord::Migration[6.0]
  def change
    create_table :keybinds do |t|
      t.references :specialization, null: false, foreign_key: true
      t.references :action_button, null: false, foreign_key: true
      t.references :ability, null: false, foreign_key: true

      t.timestamps
    end
  end
end
