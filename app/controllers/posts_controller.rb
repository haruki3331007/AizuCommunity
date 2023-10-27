class PostsController < ApplicationController
    def index
        @posts = Post.all
    end

    def new
        @new_post = Post.new
    end

    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
            redirect_to posts_path
        else
            @new_post = post
            render :new
        end    
    end

    private

    def post_params
        params.require(:post).permit( :title, :body, :image, :genre)
    end
end
