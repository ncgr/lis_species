Vigun::Application.routes.draw do
  devise_for :users
  resources :vigun_contents, :only => [:index, :edit, :update]
  root :to => "vigun_contents#index"
end
