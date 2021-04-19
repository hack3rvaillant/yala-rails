class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]
  skip_before_action :find_and_set_current_tenant
  def home
  end

  def about
    text = File.open(Rails.root.join("app", "views", "pages", "about.md")).read
    @content = Kramdown::Document.new(text, syntax_highlighter: :coderay, syntax_highlighter_opts: { css: true }).to_html
  end
end
