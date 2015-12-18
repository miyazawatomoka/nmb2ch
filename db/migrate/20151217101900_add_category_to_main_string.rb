class AddCategoryToMainString < ActiveRecord::Migration
  def change
    add_column :main_strings, :category, :integer
  end
end
