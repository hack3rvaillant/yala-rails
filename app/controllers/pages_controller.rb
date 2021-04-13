class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[home about]
  def home
  end

  def about
    text = File.open(Rails.root.join("app", "views", "pages", "about.md")).read
    @content = Kramdown::Document.new(text).to_html
  end
end
