class Album < ApplicationRecord
  validates :band_id, :title, :year, presence: true
  validates :title, uniqueness: { 
    scope: :band_id, 
    message: 'band can only have one album with that name'
  }

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
    :tracks, dependent: :destroy,
    class_name: "Track",
    foreign_key: :album_id,
    primary_key: :id
  )
end