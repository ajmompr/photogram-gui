class PhotosController < ApplicationController
  def index
    @list_of_photos = Photo.all.order( :created_at => :desc)
    render({ :template => "photos_templates/index"})
  end

  def show
    # Retrieve photo's ID
    @the_photo_id = params.fetch("path_id")
    # Retrieve matching photo instance
    @the_photo_instance = Photo.where( :id => @the_photo_id)
    # Pop out photo instance
    @the_photo = @the_photo_instance.first

    render({ :template => "photos_templates/show"})
  end 

  def update
    # Retrieve photo ID
    the_photo_id = params.fetch("path_id")
    # Locate matching instance
    matching_photo = Photo.where( :id => the_photo_id)
    # Pop out matching instance
    the_photo = matching_photo.first
    # Overwite values
    the_photo.image = params.fetch("this_image")
    the_photo.caption = params.fetch("this_caption")
    # Save
    the_photo.save
    # Redirect to photo details page
    redirect_to("/photos/#{the_photo.id}")
  end
end
