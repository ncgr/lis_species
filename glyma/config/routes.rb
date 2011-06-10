Glyma::Application.routes.draw do
  devise_for :users
  resources :glyma_contents, :only => [:index, :edit, :update]
  root :to => "glyma_contents#index"
end
