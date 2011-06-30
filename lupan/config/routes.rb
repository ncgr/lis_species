Lupan::Application.routes.draw do
  devise_for :users
  resources :lupan_contents, :only => [:index, :edit, :update]
  root :to => "lupan_contents#index"
end
