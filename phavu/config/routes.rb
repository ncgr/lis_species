Phavu::Application.routes.draw do
  devise_for :users
  resources :phavu_contents, :only => [:index, :edit, :update] do
    member do
      get :send_data_file
    end
  end
  root :to => "phavu_contents#index"
end
