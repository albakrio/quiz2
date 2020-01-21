class LikesController < ApplicationController
    before_action :authenticate_user!
    before_action :find_idea, only: [ :create ]
    before_action :authorize_user!, only: [ :create ]
  
    def create
      like = Like.new(idea: @idea, user: current_user)
      if like.save
        flash[:success] = "Idea liked"
      else
        flash[:danger] = like.errors.full_messages.join(", ")
      end
      redirect_to root_path
    end
  
    def destroy
      like = current_user.likes.find params[:id]
      if can? :destroy, like
        like.destroy
        flash[:success] = "Idea unliked"
      else
        flash[:alert] = "Can't delete like"
      end
      redirect_to root_path
    end
  

    private
  
    def find_idea
      @idea = Idea.find(params[:idea_id])
    end
  
    def authorize_user!
      unless can? :like, @idea
        flash[:danger] = "We know you like your own idea!"
        redirect_to idea_path(@idea)
      end
    end
  end
  