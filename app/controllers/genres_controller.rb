class GenresController < ApplicationController
    def index
        @genres = Genre.all
    end

    def new
        @new_genre = Genre.new
    end

    def create
        genre=Genre.new(genre_params)
        if genre.save
            redirect_to genres_path
        else
            @new_genre = Genre.new(params[:id])
            render :new
        end
    end

    def edit
        @edit_genre = Genre.find(params[:id])
    end

    def update
        if Genre.find(params[:id]).update(genre_params)
            redirect_to genres_path
        else
            @edit_genre = Genre.find(params[:id])
            render :edit
        end
    end

    def destroy
        Genre.find(params[:id]).destroy
        redirect_to genres_path 
    end

    private

    def genre_params
        params.require(:genre).permit(:name)
    end
end
