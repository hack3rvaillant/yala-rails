# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def initialize(menu_items:, user:)
    @menu_items = menu_items
    @user = user
  end
end
