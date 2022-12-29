class SessionsController < ApplicationController
  def new
    # renderöi kirjautumissivun
  end

  def create
    # haetaan usernamea vastaava käyttäjä tietokannasta
    user = User.find_by username: params[:username]
    
    if user.nil?

      # ohjataan yrittämään uudelleen, ja näytetään viesti
      redirect_to signin_path, notice: "User #{params[:username]} does not exist!"

    else
      # talletetaan sessioon kirjautuneen käyttäjän id (jos käyttäjä on olemassa)
      session[:user_id] = user.id if !user.nil?
      
      # uudelleen ohjataan käyttäjä omalle sivulleen ja näytetään viesti siellä
      redirect_to user, notice: "Welcome back!"
    end
  end

  def destroy
    # nollataan sessio
    session[:user_id] = nil
    # uudelleenohjataan sovellus pääsivulle
    redirect_to :root
  end
end
