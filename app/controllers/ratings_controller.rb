class RatingsController < ApplicationController
    before_action :set_rating, only: %i[ show edit update destroy ]

    def index
        @ratings = Rating.all
    end

    def new
        @rating = Rating.new
    end

    def create
        # tässä annetaan suoraan hashi parametrina. Sieltä vois kaivaa myös params[:rating][:beer_id] tyylillä yksittäisiä arvoja
        # Seuraava ei suoraan toimi, massasijoitus estetty:
        #Rating.create params[:rating]

        # Seuraava toimii koska siinä eksplisiittisesti määritellään mitkä kentät voi massasijoittaa
        Rating.create params[:rating].permit(:score, :beer_id)
        redirect_to ratings_path
    end
end