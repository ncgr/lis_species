Medsa::Application.routes.draw do
  devise_for :users
  resources :medsa_contents, :only => [:index, :edit, :update]
  root :to => "medsa_contents#index"
end
