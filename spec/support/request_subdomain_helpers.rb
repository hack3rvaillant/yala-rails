# spec/support/request_subdomain_helpers.rb
module RequestSubdomainHelpers
  # Sets host to use a given subdomain.
  def within_subdomain(subdomain)
    before { host! "#{subdomain}.lvm.me" }
    after  { host! "www.lvh.me" }
    yield
  end
end
