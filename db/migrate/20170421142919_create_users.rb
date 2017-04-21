class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username
      t.references :dialect, foreign_key: true
      t.boolean :active
      t.timestamps
    end
    add_index :users, :username, unique:true, name: 'idxuser1'
  end
end
