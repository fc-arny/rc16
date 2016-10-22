# frozen_string_literal: true
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:facebook, :vkontakte, :github]

  after_commit :generate_quest_items, on: [:create]

  has_many :quest_items

  scope :active, -> { where(active: true) }
  scope :rated,  -> { active.order(points: :desc) }

  def progress
    (quest_items.where('end_at < ?', Time.now).count.to_f / quest_items.count) * 100
  end

  def quest_count
    quest_items.count
  end

  def position
    pos = User.rated.where('points >= ?', points).pluck('id').index(id)

    pos ? pos + 1 : 'Вне конкурса'
  end


  private

  def generate_quest_items
    GenerateQuestItemsJob.perform_later(id)
  end
end
