module FormsHelper
  def yala_form_with(**options, &block)
    form_with(**options.merge(builder: YalaFormBuilder), &block)
  end
end
