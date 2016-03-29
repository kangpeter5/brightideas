class LikesController < ApplicationController
	def create
		idea = Idea.find(params['idea_id'])
		like = Like.create(user: current_user, idea: idea)
		redirect_to :back
	end

	def destroy
		like = Like.find(params[:id]).destroy
		redirect_to :back
	end
end
