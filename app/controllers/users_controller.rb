# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def profile
    @user = current_user
  end

  def top
    @users = [
      {
        name: 'Перекопский Евгений Валерьевич',
        image: 'user-photo.png',
        current: true,
        points: 500
      },
      {
        name: 'Петров Петр',
        image: 'user-photo.png',
        points: 400
      },
      {
        name: 'Сергей Сергеев',
        image: 'user-photo.png',
        points: 300
      },
      {
        name: 'Кандрашов Иван',
        image: 'user-photo.png',
        points: 200
      },
      {
        name: 'Сосиев Петр',
        image: 'user-photo.png',
        points: 100
      },
      {
        name: 'Морозов Артем',
        image: 'user-photo.png',
        points: 50
      },
      {
        name: 'Рыжов Евгений',
        image: 'user-photo.png',
        points: 30
      },
      {
        name: 'Максимович Артем',
        image: 'user-photo.png',
        points: 10
      }
    ]
  end
end
