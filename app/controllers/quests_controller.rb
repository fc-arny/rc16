class QuestsController < ApplicationController
  def index
    @quests = [
      {
        image: 'quest-photo.png',
        title: 'Фотография с HR',
        description: 'Описание',
        id: 1,
        completed: true,
        points: 5
      },
      {
        image: 'quest-photo.png',
        title: 'Фотография с HR',
        description: 'Описание',
        id: 2,
        completed: true,
        points: 5
      },
      {
        image: 'quest-photo.png',
        title: 'Фотография с HR',
        description: 'Описание',
        id: 3,
        completed: false,
        points: 5
      },
      {
        image: 'quest-photo.png',
        title: 'Фотография с HR',
        description: 'Описание',
        id: 4,
        completed: true,
        points: 5
      },
      {
        image: 'quest-photo.png',
        title: 'Фотография с HR',
        description: 'Описание',
        id: 5,
        completed: true,
        points: 5
      },
      {
        image: 'quest-photo.png',
        title: 'Фотография с HR',
        description: 'Описание',
        id: 6,
        completed: true,
        points: 5
      }
    ]
  end

  def show
  end
end
