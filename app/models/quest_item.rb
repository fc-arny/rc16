# frozen_string_literal: true
##
# Кветы пользователя, с его результатами
class QuestItem < ApplicationRecord
  belongs_to :quest
  belongs_to :user

  enum state: [:uncompleted, :checking, :completed,  :unresolved]

  scope :available, -> { where(state: [:uncompleted, :checking]).where('start_at <= :now AND end_at >= :now', now: Time.now) }

  def available?
    %w(uncompleted checking).include?(state) && (start_at.utc..end_at.utc).include?(Time.now.utc)
  end
end
