Rails.application.routes.draw do
 root "blog#index"
  get "/blog", to: "blog#index"
 
end
