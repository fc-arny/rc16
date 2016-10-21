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

    def index
      resources = QuestItem.all.eager_load(:user, :quest).page(params[:page])
      resources = resources.where(state: params[:state]) if params[:state].present?
      if params[:search].present?
        s = "%#{params[:search].to_s.strip}%"
        resources = resources.where.has { (user.nickname =~ s) | (user.full_name =~ s) | (quest.title =~ s) }
      end
      # FIXME: Всё, что дальше — это вместо +super+, т.к. нифига не догоняю, как это правильно всё переопределять
      search_term = params[:search].to_s.strip
      resources = order.apply(resources)
      resources = resources.page(params[:page]).per(records_per_page)
      page = Administrate::Page::Collection.new(dashboard, order: order)
      render locals: {
        resources: resources,
        search_term: search_term,
        page: page,
      }
    end

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
