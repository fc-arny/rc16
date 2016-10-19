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
               @quest_item.state = :checking
               true
             else
               @quest_item.state = :completed

               quest_params[:answer].to_s.strip.gsub(/"/, '').gsub(/'/, '') == @quest_item.quest.answer
             end

    if result
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
  end

  def quest_params
    params.require(:quest).permit!
  end
end
