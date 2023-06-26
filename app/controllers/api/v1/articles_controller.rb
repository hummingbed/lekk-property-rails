module Api
    module V1
        class ArticlesController < ApplicationController
            def index
                getArticles = Article.order('created_at DESC')
                render json: {status: 'success', message: 'loaded articles', data:getArticles}, status: :ok
            end

            def show
                getArticles = Article.find(params[:id])
                render json: {status: 'success', message: 'loaded articles', data:getArticles}, status: :ok
            end
        end
    end
end