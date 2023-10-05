class UsersController < ApplicationController
  def index
    @list_of_users = User.all.order( :username => :asc )

    render({ :template => "user_templates/index" })
  end

  def show
    @the_user = 
    render({ :template => "user_templates/show"})
  end
end
