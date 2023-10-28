class NewsController < ApplicationController
    def index
        
    end
    
    def new
        @new_news = News.new
    end

    def create
        news = News.new(news_params)
        if news.save
            redirect_to news_index_path
        else
            @new_news = news
            render "new"
        end
    end

    def edit

    end

    def destroy

    end

    private

    def news_params
        params.require(:news).permit(:title, :body, :image);
    end
end
