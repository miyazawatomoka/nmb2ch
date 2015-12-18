class CreateMainStrings < ActiveRecord::Migration
  def change
    create_table :main_strings do |t|
      t.string :title
      t.string :name
      t.string :cookie
      t.text :text
      t.datetime :uptime
      t.datetime :modtime
      t.string :img

      t.timestamps
    end
  end
end
