Vigra::Application.routes.draw do
  devise_for :users
  resources :vigra_contents, :only => [:index, :edit, :update]
  root :to => "vigra_contents#index"
end
