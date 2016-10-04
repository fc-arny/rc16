# frozen_string_literal: true
class GenerateQuestItemsJob < ApplicationJob
  def perform(user_id)
    user = User.find(user_id)

    # Квесты уже сгенерированы
    return if QuestItem.where(user_id: user_id).positive?

    # Все отдаем в разном порядке квесты
    quests = Quest.active.to_a.shuffle

    quests.each_with_index do |quest, index|
      start_at = DateTime.parse(Settings.quest.start_at) + (index * 15).minutes
      QuestItem.create(quest: quest, user: user, start_at: start_at, end_at: start_at + 60.minutes)
    end
  end
end
