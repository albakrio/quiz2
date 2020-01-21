class ReviewsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :authorize!, only: [:destroy]

    def create
        @idea = Idea.find(params[:idea_id])
        @review = Review.new review_params
        @review.idea = @idea
        @review.user = current_user

        if @review.save
            redirect_to idea_path(@idea)
        else
            @reviews = @idea.reviews.order(created_at: :desc)
            render 'ideas/show'
    end
end

    def destroy
        @review = Review.find params[:id]
        @review.destroy
        redirect_to idea_path(@review.idea)
    end

    
private

    def review_params
        params.require(:review).permit(:body, :rating)
    end

    def authorize!
        redirect_to root_path, alert: 'Not Authorized' unless can?(:crud, @review)
    end
end