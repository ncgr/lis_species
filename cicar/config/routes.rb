Cicar::Application.routes.draw do
  devise_for :users
  resources :cicar_contents, :only => [:index, :edit, :update]
  root :to => "cicar_contents#index"
end
