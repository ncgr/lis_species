Lotja::Application.routes.draw do
  devise_for :users
  resources :lotja_contents, :only => [:index, :edit, :update]
  root :to => "lotja_contents#index"
end
