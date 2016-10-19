# frozen_string_literal: true
##
# Кветы пользователя, с его результатами
class QuestItem < ApplicationRecord
  belongs_to :quest
  belongs_to :user

  enum state: [:uncompleted, :checking, :completed,  :unresolved]

  scope :available, -> { where(state: [:uncompleted, :completed, :checking]).where('start_at <= :now AND end_at >= :now', now: Time.now) }

  before_save :set_points

  def available?
    %w(uncompleted checking completed).include?(state) && (start_at.utc..end_at.utc).include?(Time.now.utc)
  end

  private

  def set_points
    user.update(points: user.points + quest.points) if state_changed? && state == 'completed'
  end
end
