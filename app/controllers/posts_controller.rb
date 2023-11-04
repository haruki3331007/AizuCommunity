class PostsController < ApplicationController
    def index
        if params[:genre]
            @posts = Post.where(genre: (params[:genre]).to_i)
        else
            @posts = Post.all
        end
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

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to posts_path
        else
            render :edit
        end   
    end

    def destroy
        post = Post.find(params[:id])
        post.destroy
        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit( :title, :body, :image, :genre)
    end
end
