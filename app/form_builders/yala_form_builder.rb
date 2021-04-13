class YalaFormBuilder < ActionView::Helpers::FormBuilder
  def labelled_text_field(attribute, args = {})
    @template.content_tag(:div, class: "form-group") do
      label(attribute, args[:label], class: "label") +
        text_field(attribute, args)
    end
  end

  def labelled_email_field(attribute, args = {})
    @template.content_tag(:div, class: "form-group") do
      label(attribute, args[:label], class: "label") +
        email_field(attribute, args)
    end
  end

  def labelled_password_field(attribute, args = {})
    @template.content_tag(:div, class: "form-group") do
      label(attribute, args[:label], class: "label") +
        password_field(attribute, args)
    end
  end
end
