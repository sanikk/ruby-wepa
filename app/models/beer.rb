class Beer < ApplicationRecord
    belongs_to :brewery
    has_many :ratings

    def average_rating
        if self.ratings.count > 0
            # return (self.ratings.sum(:score).to_f / self.ratings.count)
            return self.ratings.map {|a| a.score}.inject(:+).to_f / self.ratings.count
        end
        return 0
    end
end
