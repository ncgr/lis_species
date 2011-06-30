Phavu::Application.routes.draw do
  devise_for :users
  resources :phavu_contents, :only => [:index, :edit, :update]
  root :to => "phavu_contents#index"
end
