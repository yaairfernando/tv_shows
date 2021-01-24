class ReviewsService

  class << self
    def build(params)
      service = new(params)
      service.get_reviews
    end
  end

  def initialize(params)
    @params = params
  end

  def get_reviews
    tv_show = TvShow.find(params[:id])

    # Ugly SQL query
    # tv_show.reviews.joins(user: [team: :group])
    #     .joins(:review_type)
    #     .order('reviews.created_at ASC, groups.created_at ASC')
    #     .where('users.status = 0 AND teams.status IN (0,1)')
    #     .where("reviews.status NOT IN (2,3) AND reviews.scheduled_date <= '#{DateTime.now.utc}'")
    #     .select("reviews.id, reviews.tv_show_id, reviews.description, reviews.title, reviews.status, reviews.scheduled_date,
    #             reviews.votes, reviews.revenue, users.name AS user_name, users.email as user_email,
    #             teams.name as team_name, groups.name as group_name, (reviews.revenue / reviews.votes) revenue_per_vote,
    #             CONCAT(groups.id, '-', reviews.id) as uid")
    #     .group("reviews.id, users.name, users.email, teams.name, groups.name, groups.created_at, groups.id")
    tv_show.latest_reviews
  rescue ActiveRecord::RecordNotFound
    raise "Tv show not found!"
  end

  private

  attr_reader :params
end