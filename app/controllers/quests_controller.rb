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
    quest = @quest_item.quest

    quest.check(params[:answer]) ? head(:no_content) : head(:bad_request)
  end

  private

  def find_quest
    @quest_item = policy_scope(QuestItem).includes(:quest).find_by(quest_id: params[:id])
  end
end
