class CommentsController < ApplicationController
    def create
        comment = current_user.comments.new(comment_params)
        comment.save
        redirect_to posts_path
    end
    
    def destroy
        
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id)
    end
end
