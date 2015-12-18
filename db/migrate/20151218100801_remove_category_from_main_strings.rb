class RemoveCategoryFromMainStrings < ActiveRecord::Migration
  def change
    remove_column :main_strings, :category, :integer
  end
end
