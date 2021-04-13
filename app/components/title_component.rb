# frozen_string_literal: true

class TitleComponent < ViewComponent::Base
  def initialize(size: "base", tag: :h1, classes: "")
    @size = size
    @tag = tag
    @classes = classes
  end
end
