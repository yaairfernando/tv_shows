Rails.application.routes.draw do
  get 'tv_shows/:id/reviews', action: :index, controller: :reviews
end
