class Language
  # TODO, make this dynamic
  LIST = %w[
    fr
    en
    ar
  ]

  class << self
    def all
      LIST
    end
  end
end
