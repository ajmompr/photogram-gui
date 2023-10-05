class PhotosController < ApplicationController
  def index
    render({ :template => "photos_templates/index"})
  end
end
