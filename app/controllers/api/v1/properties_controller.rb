module Api
    module V1
        class PropertiesController < ApplicationController

        require "rest-client"
#         list all property api
            def index
                getProperty = Property.order('created_at DESC')
                render json: {status: 'success', message: 'loaded properties', data:getProperty}, status: :ok
            end

#          list property api by id
              rescue_from ActiveRecord::RecordNotFound, with: :property_not_found
              def show
                    getPropertyById = Property.find(params[:id])
                    render json: {status: 'success', message: 'loaded property', data:getPropertyById}, status: :ok
              end

              def retrievePropertyByOwner
                    toilet_value = params[:property_owner]

                    properties = Property.find_properties_with_toilet(toilet_value)

                    if properties.empty?
                        render json: {status: 'failed', message: 'No properties found'}, status: :unprocessable_entity
                    else
                        render json: {status: 'success', message: 'properties loaded', data:properties}, status: :ok
                    end
              end

              def retrieveMultipleProperties
                    if params[:search].present?

                    properties = Property.where("property_address LIKE :search OR
                                                       property_type LIKE :search OR
                                                       CAST(number_of_bedrooms AS TEXT) LIKE :search OR
                                                       CAST(number_of_sitting_rooms AS TEXT) LIKE :search OR
                                                       CAST(number_of_kitchens AS TEXT) LIKE :search OR
                                                       CAST(number_of_bathrooms AS TEXT) LIKE :search OR
                                                       CAST(number_of_toilets AS TEXT) LIKE :search OR
                                                       property_owner LIKE :search OR
                                                       description LIKE :search",
                                                      search: "%#{params[:search]}%")
                    end

                    if properties.empty?
                        render json: {status: 'failed', message: 'No properties found'}, status: :unprocessable_entity
                    else
                        render json: {status: 'success', message: 'properties loaded', data:properties}, status: :ok
                    end

              end

              def retrievePropertyByAddress
                    address_value   = params[:property_address]

                    properties = Property.find_properties_with_address(address_value)

                    if properties.empty?
                        render json: {status: 'failed', message: 'No properties found'}, status: :unprocessable_entity
                    else
                        render json: {status: 'success', message: 'properties loaded', data:properties}, status: :ok
                    end
              end

#          save or create a new property api

            def save
                saveProperty = Property.new(property_data)

                api_key = 'ac028e492b2641228470820c4e22e00c'
                query = property_data['property_address']
                api_url = 'https://api.opencagedata.com/geocode/v1/json'

                url = api_url + '?' + 'key=' + api_key + '&q=' + query + '&pretty=1' + '&no_annotations=1'
                response = RestClient.get(url)
                data = JSON.parse(response.body)
                results = data['results']
                if results.empty?
                    render json: {status: 'failed', message: 'invalid address'}, status: :unprocessable_entity
                else
                    if saveProperty.save
                        render json: {status: 'success', message: 'saved', data:saveProperty}, status: :ok
                    else
                        render json: {status: 'failed', message: 'not saved', data:saveProperty.errors}, status: :unprocessable_entity
                    end
                end
            end

            def update

                updatePropertyById = Property.find(params[:id])
                if updatePropertyById.update(property_params)
                    render json: {status: 'success', message: 'updated Property', data:updatePropertyById}, status: :ok
                else
                     render json: {status: 'failed', message: 'not saved', data:updatePropertyById.errors}, status: :unprocessable_entity
                end
            end


#           define field that are required when saving to db
            private

            def property_data
                params.permit(:property_address, :property_type, :number_of_bedrooms,
                :number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms,
                :number_of_toilets, :property_owner,:description, :valid_from, :valid_to)
            end

            def property_not_found
              render json: {status: 'failed', message: 'not found: invalid Property id' }, status: :not_found
            end

            def property_params
                params.permit(:number_of_sitting_rooms, :number_of_kitchens, :number_of_bathrooms,
                :number_of_toilets,  :description, :number_of_bedrooms)
            end

        end
    end
end