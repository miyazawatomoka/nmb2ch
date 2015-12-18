class AddAttachmentImageToSubStrings < ActiveRecord::Migration
  def self.up
    change_table :sub_strings do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :sub_strings, :image
  end
end
