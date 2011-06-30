Cajca::Application.routes.draw do
  devise_for :users
  resources :cajca_contents, :only => [:index, :edit, :update]
  root :to => "cajca_contents#index"
end
