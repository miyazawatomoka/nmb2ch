class AddAttachmentImageToMainStrings < ActiveRecord::Migration
  def self.up
    change_table :main_strings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :main_strings, :image
  end
end
