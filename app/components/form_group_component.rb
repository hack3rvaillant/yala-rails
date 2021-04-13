# frozen_string_literal: true

class FormGroupComponent < ViewComponent::Base
  def initialize(direction: "col", classes: "py-2")
    @direction = direction
    @classes = classes
  end
end
