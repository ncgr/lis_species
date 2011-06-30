Vicfa::Application.routes.draw do
  devise_for :users
  resources :vicfa_contents, :only => [:index, :edit, :update]
  root :to => "vicfa_contents#index"
end
