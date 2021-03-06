# All Administrate controllers inherit from this `Admin::ApplicationController`,
# making it the ideal place to put authentication logic or other
# before_actions.
#
# If you want to add pagination or other controller-level concerns,
# you're free to overwrite the RESTful controller actions.
module Hr
  class ApplicationController < Administrate::ApplicationController
    include Pundit
    before_action :authenticate_admin

    def authenticate_admin
      return if user_signed_in? && current_user.admin
      return render text: 'Только особые существа могут быть здесь! Изыди, смертный!'
    end

    # Override this value to specify the number of elements to display at a time
    # on index pages. Defaults to 20.
    # def records_per_page
    #   params[:per_page] || 20
    # end
  end
end
