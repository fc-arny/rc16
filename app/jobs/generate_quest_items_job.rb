# frozen_string_literal: true
class GenerateQuestItemsJob < ApplicationJob
  def perform(user_id)
    user = User.find(user_id)

    # Квесты уже сгенерированы
    return if QuestItem.where(user_id: user_id).count.positive?


    Quest.active.order(:priority).each_with_index do |quest, index|
      start_at = Settings.quest.start_at + (index * Settings.quest.interval.to_i).minutes
      QuestItem.create(quest: quest, user: user, start_at: start_at, end_at: start_at + Settings.quest.time.to_i.minutes)
    end
  end
end
