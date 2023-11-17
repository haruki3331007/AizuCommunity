class PostsController < ApplicationController
    def index
        if params[:genre] && params[:genre]!="nil"
            genre_id = (params[:genre]).to_i
            @posts = Post.where(genre: genre_id).page(params[:page]).per(15).reverse_order
            @genre = Genre.find(genre_id)
            @user = nil
        elsif params[:user_id] && params[:user_id]!="nil"
            user_id = (params[:user_id]).to_i
            @posts = Post.where(user: user_id).page(params[:page]).per(15).reverse_order
            @user = User.find(user_id)
            @genre = nil
        else
            @posts = Post.page(params[:page]).per(15).reverse_order
            @genre = nil
            @user = nil
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @new_post = Post.new
    end

    def create
        post = Post.new(post_params)
        post.user_id = current_user.id
        if post.save
            redirect_to post_path(post.id)
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
            redirect_to post_path(@post.id)
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
        params.require(:post).permit( :title, :body, :image, :genre_id)
    end
end
