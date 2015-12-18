class RemoveImgFromMainString < ActiveRecord::Migration
  def change
    remove_column :main_strings, :img, :string
  end
end
