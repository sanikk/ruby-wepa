class User < ApplicationRecord
  include RatingAverage

  validates :username, uniqueness: true, length: { minimum: 3, maximum: 30 }

  has_many :ratings

  def to_s
    username
  end
end
