require 'factory_girl_rails'
require 'support/factory_girl'
require 'capybara/rspec'

# spec helper
RSpec.configure do |config|
	config.include FactoryGirl::Syntax::Methods

  config.before do
    FactoryGirl.find_definitions
  end
  # rspec-expectations config goes here. You can use an alternate
  # assertion/expectation library such as wrong or the stdlib/minitest
  # assertions if you prefer.
  config.expect_with :rspec do |expectations|

    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end