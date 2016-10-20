# frozen_string_literal: true
class Quest < ApplicationRecord
  # active - доступные пользователяю
  # hidden - секретные зададния
  enum state: [:inactive, :active, :hidden]

  has_many :quest_items, inverse_of: :quest, dependent: :destroy
end
