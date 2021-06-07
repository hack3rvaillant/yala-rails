# frozen_string_literal: true

require "capybara/apparition"

Capybara.register_driver :apparition_debug do |app|
  Capybara::Apparition::Driver.new(app, inspector: true, headless: false)
end

Capybara.default_driver = :apparition_debug
Capybara.javascript_driver = :apparition
