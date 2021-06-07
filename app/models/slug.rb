class Slug
  BLACKLIST = %w[
    www
    api
    doc
    email
    tech
    admin
    blog
    podcast
    rss
    feed
    contact
  ]

  class << self
    def forbidden
      BLACKLIST
    end
  end
end
