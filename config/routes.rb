Rails.application.routes.draw do
  root to: 'home#index'
  get 'breed', to: 'breed#index'

  resources 'breed', only: %i[index] do
    post 'search', on: :collection
  end
  post 'reset', to: 'breed#reset'
end
