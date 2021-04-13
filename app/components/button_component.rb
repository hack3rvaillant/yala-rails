# frozen_string_literal: true

class ButtonComponent < ViewComponent::Base
  def initialize(size: :base, custom_event: nil, path: nil, style: "brand")
    @size = size
    @custom_event = custom_event
    @path = path
    @style = style
  end

  def link?
    @path.present?
  end
end
