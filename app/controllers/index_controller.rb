# frozen_string_literal: true
class IndexController < ApplicationController
  layout 'base'

  def main
    redirect_to quests_path if user_signed_in?
  end
end
