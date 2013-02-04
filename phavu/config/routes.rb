Phavu::Application.routes.draw do
  devise_for :users
  resources :phavu_contents, :only => [:index, :edit, :update]
  match "/:tab" => "phavu_contents#index"
  root :to => "phavu_contents#index"
end
