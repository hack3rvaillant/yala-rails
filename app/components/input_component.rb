# frozen_string_literal: true

class InputComponent < ViewComponent::Base
  INPUT_TYPES = %w[
    text
    password
    area
  ]
  def initialize(name:, label:, placeholder:, orientation: "col", value: "", options: {}, validations: {}, type: :text)
    @name = name
    @type = type
    @label = label
    @value = value
    @placeholder = placeholder
    @orientation = orientation
    @options = options
  end

  INPUT_TYPES.each do |t|
    define_method("#{t}?".to_sym) do
      @type == t.to_sym
    end
  end

  def autocomplete
    case @type
    when :password
      "password"
    end
  end
end
