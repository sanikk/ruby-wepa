class RatingsController < ApplicationController
    before_action :set_rating, only: %i[ show edit update destroy ]

    def index
        @ratings = Rating.all
    end
end