Arahy::Application.routes.draw do
  devise_for :users
  resources :arahy_contents, :only => [:index, :edit, :update]
  root :to => "arahy_contents#index"
end
