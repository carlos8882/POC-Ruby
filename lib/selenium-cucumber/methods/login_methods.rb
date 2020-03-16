require_relative 'required_files'
require_relative '../../../utils/api/request.rb'
require_relative './click_elements_methods.rb'
require_relative './input_methods.rb'


def login(user)
    if page.has_css?("input[type='email")
        email = getEmail(user)
        password = getPassword(user)
        enter_text("css", email, "input[type='email']")
        click('css', "input[value='Next']")
        enter_text("css", password, "input[type='password']")
        click('css', "input[value='Sign in']")
        click('css', "input[value='No']")
    end
end

