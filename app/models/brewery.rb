class Brewery < ApplicationRecord
    has_many :beers

    def to_s
        return "#{self.name}"
    end
end
