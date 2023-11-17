class CommentsController < ApplicationController
    def create
        comment = current_user.comments.new(comment_params)
        comment.save
        redirect_to request.referer
    end
    
    def destroy
        comment = Comment.find(params[:id])
        comment.destroy
        redirect_to request.referer
    end

    private

    def comment_params
        params.require(:comment).permit(:body, :post_id, :user_id)
    end
end
