class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order( :username => :asc )

    render({ :template => "user_templates/index" })
  end

  def show
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username})

    @the_user = matching_usernames.at(0)

    render({ :template => "user_templates/show"})
  end
end
