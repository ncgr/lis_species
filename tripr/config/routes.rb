Tripr::Application.routes.draw do
  devise_for :users
  resources :tripr_contents, :only => [:index, :edit, :update]
  root :to => "tripr_contents#index"
end
