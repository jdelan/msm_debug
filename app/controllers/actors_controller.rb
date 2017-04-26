class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def show
    @actor = Actor.find(params[:id])
  end

  def new_form
  end

  def create_row
    @actor = Actor.new
    @actor.dob = params[:dob]
    @actor.name = params[:name]
    @actor.bio = params[:bio]
    @actor.image_url = params[:image_url]

    @actor.save

    render("show")
  end

  def edit_form
    @actor = Actor.find(params[:id])
  end

  def update_row
    p = Actor.find(params[:id])

    p.id = params[:id]
    p.dob = params[:dob]
    p.name = params[:name]
    p.bio = params[:bio]
    p.image_url = params[:image_url]

    p.save

    redirect_to("/actors/#{p.id}")
  end

  def destroy
    @actor = Actor.find(params[:id])

    @actor.destroy
  end
end
