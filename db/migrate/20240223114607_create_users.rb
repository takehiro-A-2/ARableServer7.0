class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.text :nickname
      t.text :account_id
      t.text :memo
      t.integer :sum
      t.text :town
      t.date :birthday
      t.string :icon1
      t.string :icon2
      t.boolean :activation

      t.timestamps
    end
  end
end
