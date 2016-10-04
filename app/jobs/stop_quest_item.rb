# frozen_string_literal: true
class StopQuestItem < ApplicationJob
  def perform
    QuestItem.uncompleted.where('end_at >= ?', Time.now).update_all(state: :unresolved)
  end
end
