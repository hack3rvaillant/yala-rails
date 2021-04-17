# frozen_string_literal: true

class YalaFormBuilder < ActionView::Helpers::FormBuilder
  ERROR_CLASS = "error"

  def labelled_text_field(attribute, args = {})
    @template.content_tag(:div, class: "form-group") do
      label(attribute, args[:label], class: "label") +
        text_field(attribute, merge_args(attribute, args)) +
        display_errors(attribute)
    end
  end

  def labelled_email_field(attribute, args = {})
    @template.content_tag(:div, class: "form-group") do
      label(attribute, args[:label], class: "label") +
        email_field(attribute, merge_args(attribute, args)) +
        display_errors(attribute)
    end
  end

  def labelled_password_field(attribute, args = {})
    @template.content_tag(:div, class: "form-group") do
      label(attribute, args[:label], class: "label") +
        password_field(attribute, merge_args(attribute, args)) +
        display_errors(attribute)
    end
  end

  private

  def display_errors(attribute)
    return unless any_errors?(attribute)

    @template.content_tag(:div, class: "errors-list") do
      errors(attribute).collect do |error|
        @template.content_tag(:div, error.message)
      end.join.html_safe
    end
  end

  def errors(attribute)
    object.errors.select { |err| err.attribute == attribute }
  end

  def any_errors?(attribute)
    errors(attribute).any?
  end

  def merge_error_class(attribute, args)
    return args[:class] unless any_errors?(attribute)

    "#{ERROR_CLASS} #{args[:class]}"
  end

  def merge_args(attribute, args)
    args.merge!({class: merge_error_class(attribute, args)})
  end
end
