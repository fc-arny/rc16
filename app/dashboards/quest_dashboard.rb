require "administrate/base_dashboard"

class QuestDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::String.with_options(searchable: false),
    quest_items: Field::HasMany,
    title: Field::String,
    description: HtmlTextField,
    hint: HtmlTextField,
    points: Field::Number,
    code: Field::String,
    state: Field::String.with_options(searchable: false),
    answer: Field::Text,
    checker: Field::String,
    priority: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :title,
    :description,
    :points,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :title,
    :description,
    :hint,
    :points,
    :code,
    :state,
    :answer,
    :checker,
    :priority,
    :quest_items,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :title,
    :description,
    :hint,
    :points,
    :code,
    :state,
    :answer,
    :checker,
    :priority,
  ].freeze

  # Overwrite this method to customize how quests are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(quest)
    "Квест ##{quest.title}"
   end
end
