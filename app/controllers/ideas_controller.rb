class IdeasController < ApplicationController
	def index
		@user = current_user
		@ideas = Idea.all
	end

	def show
		@idea = Idea.find(params[:id])
		@likes = @idea.likes
		# idea_likes_id = Like.uniq.pluck(:users_id)

	    # @display =[]

	    # idea_likes_id.each do |id_L|
	    # 	u = Like.find(id)
	    # end
	    # if u.where(idea_id: params[:id]).count <2
	    #   just1 = l.find_by(idea_id: params[:id])
	    #   @display.push(just1)
	    # else
	    #   just2 = l.find_by(idea_id: params[:id])
	    #   @display.push(just1)
	    # end

	end

	def create
		idea = Idea.new(content: idea_params["content"], user: current_user)
		if idea.save
			flash[:success] = "Bright Idea Added"
			redirect_to "/ideas"
		else
			flash[:errors] = "Type something in ideas!"
			redirect_to :back
		end
	end

	def destroy
		idea = Idea.find(params[:id])
		idea.destroy if idea.user == current_user
		redirect_to "/ideas"
	end

	private
		def idea_params
			params.require(:idea).permit(:content)
		end
end
