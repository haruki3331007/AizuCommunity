class NewsController < ApplicationController
    def index
        
    end
    
    def new

    end

    def create

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
