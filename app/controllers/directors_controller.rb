class DirectorsController < ApplicationController
  def index
    @directors = Director.all
    render("/directors/index.html.erb")
  end

  def show
    @director = Director.find(params[:id])
    render("/directors/show_details.html.erb")
  end

  def new_form
    render("/directors/new_form.html.erb")
  end

  def create_row
    @director = Director.new
    @director.dob = params[:dob]
    @director.name = params[:name]
    @director.bio = params[:bio]
    @director.image_url = params[:image_url]

    @director.save

    render("show_details")
  end

  def edit_form
    @director = Director.find(params[:id])
    render("directors/edit_form.html.erb")
  end

  def update_row
    p = Director.find(params[:id])

    p.dob = params[:the_dob]
    p.name = params[:the_name]
    p.bio = params[:the_bio]
    p.image_url = params[:the_image_url]

    p.save

    redirect_to("/directors/#{p.id}")
  end

  def destroy
    @director = Director.find(params[:id])

    @director.destroy
  end
end
