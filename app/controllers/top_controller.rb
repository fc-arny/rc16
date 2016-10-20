class TopController < ApplicationController
  layout 'base'

  def index
    @users = User.order(points: :desc, updated_at: :asc)
  end
end
