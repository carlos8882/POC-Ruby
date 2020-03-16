require_relative 'methods/assertion_methods'

#step to check if text exists on the wiki content
Then(/^I should have the "([^\"]*)" account created$/) do |access_name|
    using_wait_time 4 do
        check_element_exist("a[title='#{access_name}']")
        # check_element_presence("a[title='#{access_name}']", "present")
    end
end