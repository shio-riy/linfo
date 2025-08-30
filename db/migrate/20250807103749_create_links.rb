class CreateLinks < ActiveRecord::Migration[7.2]
  def change
    create_table :links do |t|
      t.integer :user_id
      t.integer :folder_id
      t.string :url
      t.string :title
      t.text :memo

      t.timestamps
    end
  end
end
