class MainString < ActiveRecord::Base
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, content_type: [/\Aimage\/.*\Z/]
end
