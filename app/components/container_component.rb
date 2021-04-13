# frozen_string_literal: true

class ContainerComponent < ViewComponent::Base
  def initialize(max_width: "xl", classes: "py-4")
    @max_width = max_width
    @classes = classes
  end
end
