class LikesController < ApplicationController
    def create
        if params[:post_id].present?
            post = Post.find(params[:post_id])
            like = current_user.likes.new(post_id: post.id)
            like.save
            redirect_to posts_path
        else
            comment = Comment.find(params[:comment_id])
            like = current_user.likes.new(comment_id: comment.id)
            like.save
            redirect_to posts_path
        end
    end
    
    def destroy
        if params[:post_id].present?
            post = Post.find(params[:post_id])
            like = current_user.likes.find_by(post_id: post.id)
            like.destroy
            redirect_to posts_path
        else
            comment = Comment.find(params[:comment_id])
            like = current_user.likes.find_by(comment_id: comment.id)
            like.destroy
            redirect_to posts_path
        end
    end
end
