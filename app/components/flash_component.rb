# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  def flashes
    %i[notice alert error info success].map do |f|
      {
        type: f,
        content: flash[f]
      }
    end
  end
end
