require "administrate/field/base"

class HtmlTextField < Administrate::Field::Base
  def to_s
    data
  end
end
