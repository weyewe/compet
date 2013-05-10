Compet::Application.routes.draw do
  
  root :to => 'competences#index'
  match 'admin' => 'home#admin', :as => :admin, :method => :get
  namespace :api do
    resources :competences
    resources :materials 
    
    
  end
end
