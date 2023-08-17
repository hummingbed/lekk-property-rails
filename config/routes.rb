Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace 'api' do
    namespace 'v1' do
      namespace 'properties' do
        get '/', to: 'properties#allProperty' 
        get '/:id/each-properties', to: 'properties#getPropertyById'
        get '/:owner/search-owner', to: 'properties#retrievePropertyByOwner'
        get '/:search/search-multiple', to: 'properties#searchMultipleProperties'
        get '/:address/property-address', to: 'properties#searchPropertyByAddress'
        post '/create-properties', to: 'properties#addNewProperty'
        put ':id/update-properties', to: 'properties#editPropertyById'
      end
    end
  end
end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

