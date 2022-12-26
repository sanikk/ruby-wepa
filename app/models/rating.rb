class Rating < ApplicationRecord
    belongs_to :beer

    def to_s
        return "#{self.beer.name} score: #{self.score}"
    end
end
