class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.string :subject
      t.timestamps
    end
  end
end
