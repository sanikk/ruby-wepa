class Beer < ApplicationRecord
    include RatingAverage

    belongs_to :brewery
    has_many :ratings, dependent: :destroy

    def average_rating
        if self.ratings.count > 0
            # return (self.ratings.sum(:score).to_f / self.ratings.count)
            return self.ratings.map {|a| a.score}.inject(:+).to_f / self.ratings.count
        end
        return 0
    end

    def to_s
        #return self.name + " by " + self.brewery
        return "#{self.name} by #{self.brewery.name}"
    end
end
