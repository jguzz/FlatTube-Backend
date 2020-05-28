class CommentsController < ApplicationController
    def create
        @comment= Comment.new(comment_params)
        @comment.save
        render json:@comment
    end

    def index
        @comments = Comment.all
        render json:@comments
    end

    def show
        @comment = Comment.find(params[:id])
        render json:@comment
    end

    private
    def comment_params
        params.permit(:user_id, :video_id, :comment)
    end
end
