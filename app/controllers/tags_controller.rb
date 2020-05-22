class TagsController < ApplicationController
    def index
        @tags = Tag.all
        render json:@tags
    end

    def show
        @tag = Tag.find(params[:id])
        render json:@tag
    end

    def update
        @tag = Tag.find(params[:id])
        @tag.update(tag_params)
        render json:@tag
    end

    private

    def tag_params
        params.require(:tag).permit(:tag_id, :tag)
    end
end
