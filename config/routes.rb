Rails.application.routes.draw do
  get("/", { :controller => "users", :action => "index"})

  get("/users", { :controller => "users", :action => "index"})
  get("/users/:username", { :controller => "users", :action => "show"} )
  post("/modify_user/:path_id", { :controller => "users", :action => "update"})
  post("/add_user", { :controller => "users", :action => "create_user"})

  get("/photos", { :controller => "photos", :action => "index"})
  get("/photos/:path_id", { :controller => "photos", :action => "show"})
  post("/add_photo", { :controller => "photos", :action => "create_photo"})
  post("/modify_photos/:path_id", { :controller => "photos", :action => "update"})
  post("/add_comment/:path_id", { :controller => "photos", :action => "create_comment"})
  get("/delete_photo/:path_id", { :controller => "photos", :action => "destroy"})
end
