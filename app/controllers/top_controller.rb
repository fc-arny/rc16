class TopController < ApplicationController
  layout 'base'

  def index
    @users = User.rated
  end
end
