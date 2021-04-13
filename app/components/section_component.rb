# frozen_string_literal: true

class SectionComponent < ViewComponent::Base
  def initialize(background: "white", layout: :start)
    @background = background
    @layout = layout
  end
end
