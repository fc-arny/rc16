# frozen_string_literal: true
class Quest < ApplicationRecord
  # active - доступные пользователяю
  # hidden - секретные зададния
  enum state: [:inactive, :active, :hidden]

  def check(user_answer)
    send(checker_name, user_answer)
  end

  def checker_name
    meth = :compare

    "__check_#{meth}"
  end

  private

  ##
  # Сравнение примитивное
  def __check_compare(user_answer)
    user_answer.to_s.strip.downcase == answer.to_s
  end
end
