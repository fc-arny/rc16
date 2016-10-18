# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte, :github]

  after_commit :generate_quest_items, on: [:create]

  has_many :quest_items

  def progress
    (quest_items.where('end_at < ?', Time.now).count.to_f / quest_items.count) * 100
  end

  private

  def generate_quest_items
    GenerateQuestItemsJob.perform_later(id)
  end
end
