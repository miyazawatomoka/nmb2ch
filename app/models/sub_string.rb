class SubString < ActiveRecord::Base
  validates :text, length: { minimum: 10 }
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_size :image, :less_than => 5.megabytes
  validates_attachment_content_type :image, content_type: [/\Aimage\/.*\Z/]
  belongs_to :main_string, primary_key: :mainString_id
end
