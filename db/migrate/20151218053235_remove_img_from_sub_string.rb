class RemoveImgFromSubString < ActiveRecord::Migration
  def change
    remove_column :sub_strings, :img, :string
  end
end
