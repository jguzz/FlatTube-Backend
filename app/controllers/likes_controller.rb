class LikesController < ApplicationController
		before_action :find_like,only: [:show, :edit, :update]
	
		def index
			@likes=Like.all
			render json:@likes
		end
	
		def show
			render json:@like
		end
		

	
		def create
			@like= Like.new(like_params)
			@like.save
	
			render json:@like
		end
		 
		def update
			@like.update(params.require(:like).permit!)
			if @like.valid?
				render json:@like
			else
				flash[:errors]=@like.erors.full_messages
			end
		end
	  
		  def delete 
				Like.find(params[:id]).delete
			end
	
		private
	
		def like_params
			params.require(:like).permit!
		end
	
		def find_like
			@like = Like.find(params[:id])
		end
	
	

end
