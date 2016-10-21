# frozen_string_literal: true
class QuestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_quest, only: [:update, :show]

  ##
  # Список доступных пользователю квестов
  def index
    @quest_items = policy_scope(QuestItem).order(:start_at).includes(:quest)
    @quest_items = @quest_items.available unless params[:all]
  end

  ##
  # Квест, если квест уже недоступен - говорим перейти к списку
  def show
  end

  ##
  # Отвечаем на квест
  def update
    return head(:bad_request) if %w(completed unresolved).include?(@quest_item.state)

    result = case @quest_item.quest.code
             when 'photo', 'feedback', 'questionnaire'
               message = 'Ответ отправлен на проверка ораганизаторов'
               @quest_item.state = :checking
               true
             else
               message = "Верный ответ!  +#{@quest_item.quest.points}#{Russian.p(@quest_item.quest.points, 'бал', 'бала', 'балов')}"
               @quest_item.state = :completed

               quest_params[:answer].downcase.to_s.strip.gsub(/"/, '').gsub(/'/, '').gsub(/\s/, '') == @quest_item.quest.answer.gsub(/\s/, '').downcase
             end

    if result
      flash[:quest] = message
      @quest_item.data = quest_params
      @quest_item.save
      head :no_content
    else
      head :bad_request
    end
  end

  private

  def find_quest
    @quest_item = policy_scope(QuestItem).includes(:quest).find_by(quest_id: params[:id])

    return head :not_found unless @quest_item
  end

  def quest_params
    params.require(:quest).permit!
  end
end
