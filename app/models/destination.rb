class Destination < ApplicationRecord
    belongs_to :redactor
    belongs_to :category
    has_many :ratings
    has_attached_file :destination_img, styles: { destination_index: "300x300>", destination_show: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :destination_img, content_type: /\Aimage\/.*\z/
end
