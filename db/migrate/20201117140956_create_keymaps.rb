class CreateKeymaps < ActiveRecord::Migration[6.0]
  def change
    create_table :keymaps do |t|
      t.string :name

      t.timestamps
    end
  end
end
