Medtr::Application.routes.draw do
  devise_for :users
  resources :medtr_contents, :only => [:index, :edit, :update]
  root :to => "medtr_contents#index"
end
