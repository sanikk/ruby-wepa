module RatingAverage
  extend ActiveSupport::Concern

  def average_rating
    return 0 if ratings.empty?

    '%.2f' % (ratings.map(&:score).inject(:+).to_f / ratings.count)
  end
end
