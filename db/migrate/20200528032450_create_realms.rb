class CreateRealms < ActiveRecord::Migration[6.0]
  def change
    create_table :realms do |t|
      t.string :name
      t.string :slug
      t.integer :connected_realm
      t.timestamps
    end
  end
end
