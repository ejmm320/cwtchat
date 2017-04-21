class CreateDialects < ActiveRecord::Migration[5.0]
  def change
    create_table :dialects do |t|
      t.string :name
      t.string :apiurl
      t.string :icon
      t.timestamps
    end
    add_index :dialects, :name, unique: true, name: 'idxdialect1'
  end
end
