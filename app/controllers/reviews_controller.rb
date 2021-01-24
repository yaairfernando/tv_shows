class ReviewsController < ApplicationController
  def index
    @reviews = ReviewsService.build(index_params)
    render json: @reviews
  end

  private

  def index_params
    params.permit(:id)
  end
end
