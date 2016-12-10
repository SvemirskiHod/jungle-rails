class ReviewsController < ApplicationController
  before_filter :current_user

  def create
    @review_user = current_user
    product = Product.find(params["product_id"])
    product.reviews.new(user_id: current_user.id, description: params["review"]["description"], rating: params["review"]["rating"])
    product.save
    redirect_to "/products/#{params["product_id"]}"
  end

  def remove_review
    review_id = params[:review_id].to_s
    Review.destroy(review_id)
    redirect_to :back
  end

end
