class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true
      t.integer :likeable_id
      t.string :likeable_type # t.references :likeable, polymorphic: true, index: true
      t.timestamps
    end

    add_index :likes, [:likeable_id,:likeable_type]
  end
end
