Lencu::Application.routes.draw do
  devise_for :users
  resources :lencu_contents, :only => [:index, :edit, :update]
  root :to => "lencu_contents#index"
end
