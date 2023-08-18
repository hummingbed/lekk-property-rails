module Api
    module V1
        module Properties
        class PropertiesController < ApplicationController

        require "rest-client"
        require 'net/http'
        require 'json'
#         list all property api
            def allProperty 
                properties = Property.order('created_at DESC')
                render json: {status: 'success', message: 'all properties loaded successfully', data:properties}, status: :ok
            end

#          list property api by id
              rescue_from ActiveRecord::RecordNotFound, with: :property_not_found
              def getPropertyById
                    property = Property.find(params[:id])
                    render json: {status: 'success', message: "property id #{params[:id]} loaded successfully ", data:property}, status: :ok
              end

              def retrievePropertyByOwner
                propertyOwner = params[:owner]
                    properties = Property.findPropertiesWithToilet(propertyOwner)
                    if properties.empty?
                        render json: {status: 'failed', message: "#{params[:owner]} property not found"}, status: 404
                    else
                        render json: {status: 'success', message: "#{params[:owner]} properties displayed", data:properties}, status: :ok
                    end
              end

              def searchMultipleProperties
                propertyParam = params[:search]
                    if propertyParam.present?
                        properties = Property.multiplePropertySearch(propertyParam)
                    end

                    if properties.empty?
                        render json: {status: 'failed', message: "#{propertyParam} property not found"}, status: 404
                    else
                        render json: {status: 'success', message: 'properties loaded', data:properties}, status: :ok
                    end
              end

              def searchPropertyByAddress
                    addressValue   = params[:address]
                    properties = Property.findPropertiesWithAddress(addressValue)

                    if properties.empty?
                        render json: {status: 'failed', message: 'No properties found'}, status: 404
                    else
                        render json: {status: 'success', message: 'properties loaded', data:properties}, status: :ok
                    end
              end

#          save or create a new property api

            def addNewProperty                
                saveProperty = Property.new(property_data)
                
                if property_data.empty?
                    render json: {status: 'failed', message: 'please insert data in the body'}, status: :unprocessable_entity
                else
                    api_key = 'ac028e492b2641228470820c4e22e00c'
                    query = property_data['property_address']
                    api_url = 'https://api.opencagedata.com/geocode/v1/json'
                    
                    if query.nil? || query.empty?
                        render json: {status: 'failed', message: 'property address is empty'}, status: :unprocessable_entity
                    else
                        url = "#{api_url}?key=#{api_key}&q=#{query}&pretty=1&no_annotations=1"
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
                end
            end

            def editPropertyById

                property = Property.find(params[:id])

                if property
                property.update(
                    description: params[:description],  number_of_bedrooms: params[:number_of_bedrooms],
                    number_of_sitting_rooms: params[:number_of_sitting_rooms], number_of_kitchens: params[:number_of_kitchens],
                    number_of_bathrooms: params[:number_of_bathrooms], number_of_toilets: params[:number_of_toilets],
                    valid_to: params[:valid_to],
                )
                    render json: {status: 'success', message: 'updated Property', data:property}, status: :ok
                else
                    render json: {status: 'failed', message: 'not saved', data:property.errors}, status: :unprocessable_entity
                end
            end

#           define field that are required when saving to db
            private

            def property_data
                params.require(:property).permit(:property_address, :property_type, :number_of_bedrooms, :number_of_sitting_rooms,
                    :number_of_kitchens, :number_of_bathrooms, :number_of_toilets, :property_owner, :description, :valid_from, :valid_to
                )
            end

            def property_not_found
              render json: {status: 'failed', message: 'not found: invalid Property id' }, status: 404
            end

        end

        end
    end
end