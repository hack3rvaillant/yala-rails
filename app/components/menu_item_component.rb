# frozen_string_literal: true

class MenuItemComponent < ViewComponent::Base
  def initialize(label:, active: false, path: "#")
    @label = label
    @active = active
    @path = path
  end

  def state_class
    @active ? 'menu-item active' : 'menu-item'
  end
end
