class Picture < ApplicationRecord
  has_attached_file :image,
  # url: "/system/:hash.:extension",
  # hash_secret: "abc123",
                  styles: { original: ["922x922>", :jpg],
                            thumb: ["100x100>", :jpg]},
                  convert_options: {
                    thumb: "-quality 100 -strip",
                    original: "-quality 100 -strip" }


  has_many :tags
  has_many :associations
  has_many :users, through: :associations

  validates_attachment :image,
        presence: true,
        content_type: {
          content_type: ["image/jpeg", "image/gif", "image/png"]
        },
       size: { in: 0..3.megabytes }

end
