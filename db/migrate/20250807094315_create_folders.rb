class CreateFolders < ActiveRecord::Migration[7.2]
  def change
    create_table :folders do |t|
      t.integer :user_id
      t.string :name
      t.boolean :is_public

      t.timestamps
    end
  end
end
