class CreateSubStrings < ActiveRecord::Migration
  def change
    create_table :sub_strings do |t|
      t.string :title
      t.string :name
      t.string :cookie
      t.text :text
      t.datetime :uptime
      t.string :img
      t.references :mainString, index: true

      t.timestamps
    end
  end
end
