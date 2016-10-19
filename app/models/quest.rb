# frozen_string_literal: true
class Quest < ApplicationRecord
  # active - доступные пользователяю
  # hidden - секретные зададния
  enum state: [:inactive, :active, :hidden]
end
