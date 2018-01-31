Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root"categories#index" 
  # get "categories/index"
  get "categories/show"
  get "categories/new"
  get "categories/delete"
  get "categories/edit"
  get "categories/create"
  post "categories/remove"
  post "categories/update"
end
