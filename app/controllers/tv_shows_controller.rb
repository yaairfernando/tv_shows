class TvShowsController < ApplicationController
  def show
    @show = TvShowService.build(show_params)
    render json: @show
  end

  private

  def show_params
    params.permit(:id)
  end
end
