class RatingsController < ApplicationController
  before_action :set_rating, only: %i[show edit update]

  def index
    @ratings = Rating.all
  end

  def new
    @rating = Rating.new
    @beers = Beer.all
  end

  def create
    # tässä annetaan suoraan hashi parametrina. Sieltä vois kaivaa myös params[:rating][:beer_id] tyylillä yksittäisiä arvoja
    # Seuraava ei suoraan toimi, massasijoitus estetty:
    # Rating.create params[:rating]

    # Seuraava toimii koska siinä eksplisiittisesti määritellään mitkä kentät voi massasijoittaa
    # lisätty myös luotavan ratingin tallennus tähän
    rating = Rating.new params[:rating].permit(:score, :beer_id)
    rating.user = current_user
    rating.save
    # tallennetaan luotu rating sessioon
    # session[:last_rating] = "#{rating.beer.name} #{rating.score} points"

    redirect_to ratings_path
  end

  def destroy
    rating = Rating.find(params[:id])
    rating.delete
    redirect_to ratings_path
  end
end
