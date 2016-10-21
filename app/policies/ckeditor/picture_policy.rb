class Ckeditor::PicturePolicy
  attr_reader :user, :picture

  def initialize(user, picture)
    @user = user
    @picture = picture
  end

  def index?
    user.present?
  end

  def create?
    user&.admin?
  end

  def destroy?
    user&.admin? && picture.assetable_id == user.id
  end
end
