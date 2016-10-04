# frozen_string_literal: true
class Quest < ApplicationRecord
  # active - доступные пользователяю
  # hidden - секретные зададния
  enum state: [:inactive, :active, :hidden]

  def check(user_answer)
    meth = "__check_#{checker}"
    send(meth, user_answer)
  end

  private

  ##
  # Сравнение
  def __check_compare(user_answer)
    user_answer.to_s.strip.downcase == answer.to_s
  end
end
