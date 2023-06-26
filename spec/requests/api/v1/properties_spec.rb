require 'swagger_helper'

RSpec.describe 'api/v1/properties', type: :request do

  path '/api/v1/all-properties' do

    get('list properties') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/each-properties/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show property') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/create-properties' do

    post('save property') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/update-properties/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    put('update property') do
      response(200, 'successful') do
        let(:id) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/retrieve-property_owner/{property_owner}' do
    # You'll want to customize the parameter types...
    parameter name: 'property_owner', in: :path, type: :string, description: 'property_owner'

    get('retrievePropertyByOwner property') do
      response(200, 'successful') do
        let(:property_owner) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/retrieve-property_address/{property_address}' do
    # You'll want to customize the parameter types...
    parameter name: 'property_address', in: :path, type: :string, description: 'property_address'

    get('retrievePropertyByAddress property') do
      response(200, 'successful') do
        let(:property_address) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end

  path '/api/v1/retrieve-multiple-property/{search}' do
    # You'll want to customize the parameter types...
    parameter name: 'search', in: :path, type: :string, description: 'search'

    get('retrieveMultipleProperties property') do
      response(200, 'successful') do
        let(:search) { '123' }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
