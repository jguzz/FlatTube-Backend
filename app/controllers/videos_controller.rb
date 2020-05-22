class VideosController < ApplicationController
    def index
        @videos = Video.all
        render json:@videos
    end

    def show
        @video = Video.find(params[:id])
        render json:@pet
    end

    def update
        @video = Video.find(params[:id])
        @video.update(video_params)
        render json:@video
    end

    private

    def video_params
        params.require(:video).permit(:video_id, :title, :videoURL, :description, :channelTitle, :views, :commentCount, :uploadDate, :thumbnailURL)
    end
end
