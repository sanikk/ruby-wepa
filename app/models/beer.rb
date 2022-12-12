class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :ratings

    def average_rating
        return self.ratings.inject(:+)
    end

end
