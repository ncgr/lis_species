Lupal::Application.routes.draw do
  devise_for :users
  resources :lupal_contents, :only => [:index, :edit, :update]
  root :to => "lupal_contents#index"
end
