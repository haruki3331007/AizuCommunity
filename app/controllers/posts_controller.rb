class PostsController < ApplicationController
    def index

    end

    def new

    end

    def create
        post = Post.new(params[:id])
        post.save
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:user_id, :title, :body, :image, :genre)
    end
end
