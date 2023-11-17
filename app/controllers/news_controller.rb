class NewsController < ApplicationController
    before_action :correct_admin, except: [:index, :show]

    def index
        @news = News.page(params[:page]).per(5).reverse_order
    end

    def show
        @news = News.find(params[:id])
    end
    
    def new
        @new_news = News.new
    end

    def create
        news = News.new(news_params)
        if news.save
            redirect_to news_path(news.id)
        else
            @new_news = news
            render "new"
        end
    end

    def edit
        @edit_news = News.find(params[:id])
    end

    def update
        news = News.find(params[:id])
        if news.update(news_params)
            redirect_to news_path(news.id)
        else
            @edit_news = news
            render "edit"
        end
    end

    def destroy
        news = News.find(params[:id])
        news.destroy
        redirect_to news_index_path
    end

    private

    def correct_admin
        unless admin_signed_in?
            redirect_to root_path
        end
    end

    def news_params
        params.require(:news).permit(:title, :body, :image);
    end
end
