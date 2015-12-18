class AddTypeIdToMainStrings < ActiveRecord::Migration
  def change
    add_column :main_strings, :type_id, :integer
  end
end
