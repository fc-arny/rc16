class Ckeditor::AttachmentFilePolicy
  attr_reader :user, :attachment

  def initialize(user, attachment)
    @user = user
    @attachment = attachment
  end

  def index?
    user.present?
  end

  def create?
    user&.admin?
  end

  def destroy?
    user&.admin? && attachment.assetable_id == user.id
  end
end
