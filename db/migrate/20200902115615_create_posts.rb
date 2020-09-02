class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.references :organization, foreign_key: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
