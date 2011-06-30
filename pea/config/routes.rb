Pea::Application.routes.draw do
  devise_for :users
  resources :pea_contents, :only => [:index, :edit, :update]
  root :to => "pea_contents#index"
end
