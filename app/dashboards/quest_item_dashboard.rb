require "administrate/base_dashboard"

class QuestItemDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    quest: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    state: Field::String.with_options(searchable: false),
    data: Field::String.with_options(searchable: false),
    start_at: Field::DateTime,
    end_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :quest,
    :user,
    :id,
    :state,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :quest,
    :user,
    :id,
    :state,
    :data,
    :start_at,
    :end_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :quest,
    :user,
    :state,
    :data,
    :start_at,
    :end_at,
  ].freeze

  # Overwrite this method to customize how quest items are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(quest_item)
  #   "QuestItem ##{quest_item.id}"
  # end
end
