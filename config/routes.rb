Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "measures#index"

  get 'measures', to: 'measures#index' # This creates measures_path
end
