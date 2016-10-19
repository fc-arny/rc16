# frozen_string_literal: true
class GenerateQuestItemsJob < ApplicationJob
  def perform(user_id)
    user = User.find(user_id)

    # Квесты уже сгенерированы
    return if QuestItem.where(user_id: user_id).count.positive?

    start_with = Rails.env.production? ? DateTime.parse(Settings.quest.start_at) : Time.now

    Quest.active.order(:priority).each_with_index do |quest, index|
      start_at = start_with + (index * 15).minutes
      QuestItem.create(quest: quest, user: user, start_at: start_at, end_at: start_at + 45.minutes)
    end
  end
end
