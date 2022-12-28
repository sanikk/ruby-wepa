class Brewery < ApplicationRecord
    include RatingAverage

    has_many :beers, dependent: :destroy
    has_many :ratings, through: :beers

    # def average_rating
    #     if self.ratings.count > 0
    #         # return (self.ratings.sum(:score).to_f / self.ratings.count)
    #         return self.ratings.map {|a| a.score}.inject(:+).to_f / self.ratings.count
    #     end
    #     return 0
    # end

    def to_s
        return "#{self.name}"
    end
end
