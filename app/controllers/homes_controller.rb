class HomesController < ApplicationController
    def top
        @news = News.last
    end

    def aboutUs

    end
end
