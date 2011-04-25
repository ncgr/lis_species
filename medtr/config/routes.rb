Medtr::Application.routes.draw do
  devise_for :users
  resources :medtr_contents, :only => [:index, :edit, :update] do
    member do
      get :send_data_file
    end
  end
  root :to => "medtr_contents#index"
end
