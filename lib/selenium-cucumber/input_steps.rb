require_relative 'methods/input_methods'

# input text into an alloy editor
Then(/^I enter "([^\"]*)" into the rich text editor$/) do |text|
    enter_text("css", text, "input[type='email']")
end

# enter text into the search bar steps
Then(/^I enter "([^\"]*)" in the search bar$/) do |text|
    clear_text("css", "input[id^='quickFind_text']")
    enter_text("css", text, "input[id^='quickFind_text']")
end

# enter text into input field steps
Then(/^I enter "([^\"]*)" into the "([^\"]*)" input field$/) do |text, access_name|
    clear_text("css", "input[type='#{access_name}']")
    enter_text("css", text, "input[type='#{access_name}']")
end
