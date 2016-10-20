require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    quest_items: Field::HasMany,
    id: Field::String.with_options(searchable: false),
    nickname: Field::String,
    full_name: Field::String,
    company: Field::String,
    gender: Field::String,
    date_of_birth: Field::DateTime,
    hireable: Field::Boolean,
    website_url: Field::String,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    confirmation_token: Field::String,
    confirmed_at: Field::DateTime,
    confirmation_sent_at: Field::DateTime,
    unconfirmed_email: Field::String,
    github_uid: Field::String,
    github_url: Field::String,
    facebook_uid: Field::String,
    facebook_url: Field::String,
    vkontakte_uid: Field::String,
    vkontakte_url: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    points: Field::Number,
    active: Field::Boolean,
    admin: Field::Boolean,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :full_name,
    :nickname,
    :email,
    :quest_items,
    :points,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :nickname,
    :full_name,
    :company,
    :website_url,
    :email,
    :github_url,
    :facebook_url,
    :vkontakte_url,
    :points,
    :active,
    :admin,
    :quest_items,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :active,
    :admin,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.

  def display_resource(user)
    "#{user.full_name} @#{user.nickname}"
  end
end
