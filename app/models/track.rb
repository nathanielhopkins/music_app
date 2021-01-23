class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true
  validates :bonus, inclusion: { in: [true, false]}
  validates :ord, uniqueness: { scope: :album_id }

  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )

  has_one(
    :band,
    through: :album,
    source: :band
  )

end