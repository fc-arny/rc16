# frozen_string_literal: true
##
# Кветы пользователя, с его результатами
class QuestItem < ApplicationRecord
  belongs_to :quest
  belongs_to :user

  enum state: [:uncompleted, :completed, :unresolved]
end
