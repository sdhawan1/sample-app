
Rails.application.routes.draw do
  root                'static_pages#home'
  get    'help'    => 'static_pages#help'
  get    'about'   => 'static_pages#about'
  get    'contact' => 'static_pages#contact'
  get    'login'   => 'sessions#new'
  get    'logout'  => 'static_pages#logout'
  get    'find'    => 'searchs#new'
  post   'find'    => 'searchs#create'
  get    'results' => 'searchs#index'
  resources :users
  resources :professors do
    collection do
      get :autocomplete
    end
  end
  resources :reviews
end
