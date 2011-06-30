Phacn::Application.routes.draw do
  devise_for :users
  resources :phacn_contents, :only => [:index, :edit, :update]
  root :to => "phacn_contents#index"
end
