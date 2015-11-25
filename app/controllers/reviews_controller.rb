class ReviewsController < ApplicationController

  def new
    @restuarant = Restaurant.find(params[:restuarant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @restaurant.reviews.create(review_params)
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

end
