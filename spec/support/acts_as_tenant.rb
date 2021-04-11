RSpec.configure do |config|
  config.before(:suite) do |example|
    # Make the default tenant globally available to the tests
    $default_community = Community.create!(name: "Global Test Community", subdomain: "community", domain: "community.dev") # standard:disable Style/GlobalVars
  end

  config.before(:each) do |example|
    if example.metadata[:type] == :request
      # Set the `test_tenant` value for integration tests
      ActsAsTenant.test_tenant = $default_community # standard:disable Style/GlobalVars
    else
      # Otherwise just use current_tenant
      ActsAsTenant.current_tenant = $default_community # standard:disable Style/GlobalVars
    end
  end

  config.after(:each) do |example|
    # Clear any tenancy that might have been set
    ActsAsTenant.current_tenant = nil
    ActsAsTenant.test_tenant = nil
  end
end
