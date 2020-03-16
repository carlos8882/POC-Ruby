require_relative 'methods/click_elements_methods'

# click the button
When(/^I click the "(.*?)" button$/) do |access_name|
  click('css', "input[value='#{access_name}']")
end

# click the search button
When(/^I click the search button$/) do 
  click('css', "button[id^='quickFind_button']")
end

# click the item in context menu
When(/^I click the "(.*?)" context menu option$/) do |access_name|
  click('css', "li[title='#{access_name}']")
end
