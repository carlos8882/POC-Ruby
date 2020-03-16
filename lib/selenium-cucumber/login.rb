require_relative 'methods/login_methods'

# step to switch to main content
When(/^I login with "([^\"]*)"$/) do |user|
    login(user)
end