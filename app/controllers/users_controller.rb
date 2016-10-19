# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile, :top]

  def profile
    @user = current_user
  end

  def top
    @users = User.order(points: :desc, updated_at: :asc).limit(25)
  end
end
