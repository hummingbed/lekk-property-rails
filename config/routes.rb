Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace 'api' do
    namespace 'v1' do
    get '/all-properties', to: 'properties#index'
    get '/each-properties/:id', to: 'properties#show'
    post '/create-properties', to: 'properties#save'
    put '/update-properties/:id', to: 'properties#update'
    get '/retrieve-property_owner/:property_owner', to: 'properties#retrievePropertyByOwner'
    get '/retrieve-property_address/:property_address', to: 'properties#retrievePropertyByAddress'
    get '/retrieve-multiple-property/:search', to: 'properties#retrieveMultipleProperties'
#         resources :properties
#         resources :articles
    end
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

