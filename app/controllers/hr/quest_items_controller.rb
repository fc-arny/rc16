module Hr
  class QuestItemsController < Hr::ApplicationController
    # To customize the behavior of this controller,
    # simply overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = QuestItem.all.paginate(10, params[:page])
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   QuestItem.find_by!(slug: param)
    # end

    # See https://administrate-docs.herokuapp.com/customizing_controller_actions
    # for more information

    def accept
      QuestItem.transaction do
        QuestItem.lock.find(params[:id]).update!(state: :completed)
      end
      redirect_to :back, notice: 'Ответ был принят'
    end

    def reject
      QuestItem.transaction do
        QuestItem.lock.find(params[:id]).update!(state: :uncompleted)
      end
      redirect_to :back, notice: 'Ответ был отклонён'
    end
  end
end
