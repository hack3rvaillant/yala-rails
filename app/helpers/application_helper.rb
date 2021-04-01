# Here are the helper methods that are useful for the whole application
module ApplicationHelper
  def title(text)
    content_for :title do
      text
    end
  end

  def flashes
    %i[notice error info success].map do |f|
      {
        type: f,
        content: flash[f]
      }
    end
  end
end
