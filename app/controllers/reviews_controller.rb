class ReviewsController < ApplicationController

  def new
    @restuarant = Restaurant.find(params[:restuarant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    @review.restaurant_id = @restaurant.id
    @review.user_id = current_user.id
    if @review.save
      redirect_to restaurants_path
    else
      flash[:notice] = "Sorry, you can only leave one review per restaurant!"
      redirect_to '/restaurants'
    end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end


end
