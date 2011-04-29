Lotja::Application.routes.draw do
  devise_for :users
  resources :lotja_contents, :only => [:index, :edit, :update] do
    member do
      get :send_data_file
    end
  end
  root :to => "lotja_contents#index"
end
