class Album < ApplicationRecord
  validates :band_id, :title, :year, :live_album, presence: true
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
end