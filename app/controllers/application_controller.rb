# frozen_string_literal: true
class ApplicationController < ActionController::Base
  include Pundit
  protect_from_forgery with: :exception

  before_action :stop_items

  private

  def stop_items
    Rails.cache.fetch([:stop_quest_items], expires_in: 1.minute) do
      StopQuestItem.perform_later
    end
  end
end
