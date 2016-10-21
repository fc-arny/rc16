class TopController < ApplicationController
  layout 'base'

  def index
    @users = User.rated.limit(25)

    render partial: 'users', layout: false if request.xhr?
  end
end
