Rails.application.routes.draw do
  resources :pokemons
  root :to => 'pokemons#index'
  get 'destroy_all' => 'pokemons#destroy_all'
  get 'csv' => 'pokemons#sendCSV'
  post 'csv' => 'pokemons#readCSV'
end
