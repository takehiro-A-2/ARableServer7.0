class CreateConfigs < ActiveRecord::Migration[7.0]
  def change
    create_table :configs do |t|
      t.text :account_id
      t.text :account_name
      t.text :account_mail
      t.text :introduction
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
