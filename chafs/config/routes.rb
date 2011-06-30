Chafs::Application.routes.draw do
  devise_for :users
  resources :chafs_contents, :only => [:index, :edit, :update]
  root :to => "chafs_contents#index"
end
