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

  def create_photo
    # create new photo instance
    new_photo = Photo.new

    # add details
    new_photo.image = params.fetch("the_image")
    new_photo.caption = params.fetch("the_caption")
    new_photo.owner_id = params.fetch("the_owner")
    # save
    new_photo.save
    # fetch new photo's id
    new_photo_id = new_photo.id
    # redirect to the details page
    redirect_to("/photos/#{new_photo_id}")
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

  def create_comment
    #Retrieve photo ID
    the_photo_id = params.fetch("path_id")
    # Create a new instance in matching photo comment table
    new_comment = Comment.new
    # Retrieve user input from params
    new_comment.photo_id = params.fetch("path_id")
    new_comment.body = params.fetch("this_comment")
    new_comment.author_id = params.fetch("this_author_id")
    # Save
    new_comment.save
    # Re-direct to /photos/# URL
    redirect_to("/photos/#{the_photo_id}")
  end

  def destroy
    # Retrieve the photo ID
    the_photo_id = params.fetch("path_id")
    # Search the ID column for matching instance
    matching_instance = Photo.where( :id => the_photo_id)
    # Pop out the matching instance
    the_photo = matching_instance.first
    # Delete the instance
    the_photo.destroy
   
    # redirect to 
    redirect_to("/photos")
  end
end
