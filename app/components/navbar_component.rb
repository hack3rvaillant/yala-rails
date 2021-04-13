# frozen_string_literal: true

class NavbarComponent < ViewComponent::Base
  def initialize(main_menu_items:, user:)
    @main_menu_items = main_menu_items
    @user = user
  end

  def active?(path)
    helpers.menu_item_active?(path)
  end
end
