class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def new

    end

    def create
        genre=Genre.new(params[:id])
        genre.save
        redirect_to genre_index_path
    end

    private

    def genre_params
        params.require(:genre).permit(:name);
    end
end
