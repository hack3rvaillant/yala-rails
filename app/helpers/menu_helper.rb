# frozen_string_literal: true

# Here are the helper methods that are useful for the whole application

require "ostruct"

module MenuHelper
  MAIN_MENU_ITEMS =
    [
      {
        label: "About",
        path: "/about"
      }, {
        label: "Contact",
        path: "/contact"
      }, {
        label: "Home",
        path: "/"
      }
    ]

  def main_menu_items
    MAIN_MENU_ITEMS.map do |menu_item|
      OpenStruct.new(menu_item)
    end
  end

  def menu_item_active?(path)
    request.path == path
  end
end
