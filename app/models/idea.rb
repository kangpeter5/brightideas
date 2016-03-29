class Idea < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  validates :content, presence: true

  def find_like_id current_user
	  Like.select(:id).where(user: current_user, idea: self)[0].id
  end

   # id = idea_id
  def no_repeats(idea_id)
    @likes = Likes.where(idea_id: idea_id)

    @display =[]
    @likes.each do |l|
      if l.where(idea_id: idea_id).count <2
        just1 = l.find_by(idea_id: idea_id)
        @display.push(just1)
      else
        just2 = l.find_by(idea_id: idea_id)
        @display.push(just1)
      end
    end
  	
  end
end
