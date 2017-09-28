class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user
      t.string :name
      t.string :surname
      t.string :avatar_url
      t.timestamps
    end
  end
end
