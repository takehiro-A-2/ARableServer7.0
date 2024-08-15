class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.text :account_id
      t.string :image
      t.text :object_id
      t.text :filename
      t.text :extension
      t.text :size
      t.text :volume
      t.decimal :x
      t.decimal :y
      t.decimal :z
      t.text :text
      t.boolean :activation

      t.timestamps
    end
  end
end
