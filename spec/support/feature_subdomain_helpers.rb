
# spec/support/request_subdomain_helpers.rb
module FeatureSubdomainHelpers
  # Sets host to use a given subdomain.
  # Sets Capybara to use a given subdomain.
  def within_subdomain(subdomain)
    before { Capybara.default_host = "http://#{subdomain}.lvh.me" }
    after  { Capybara.default_host = "http://lvh.me" }
    yield
  end
end
