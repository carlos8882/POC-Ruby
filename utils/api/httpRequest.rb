require 'httpclient'

puts HTTPClient::LIB_NAME
puts HTTPClient::RUBY_VERSION_STRING
puts HTTPClient::VERSION

#!/usr/bin/ruby

require 'httpclient'
require 'timeout'

# client = HTTPClient.new
# cont = client.get_content 'http://www.google.com'

# puts cont

# def getNewHttpClient()

    clnt = HTTPClient.new
    domain = 'https://beto88820.api.crm2.dynamics.com/api/data/v9.1/'
    user = 'carlosapi@beto8882.onmicrosoft.com'
    password = 'Rokusho.2'
    status = Timeout::timeout(20) {    
        clnt.set_auth(domain, user, password)
        # puts clnt.get_content('http://dev.ctor.org/http-access2/login').status
    }
    p clnt.get_content('http://dev.ctor.org/http-access2/login').status
    
# end

# getNewHttpClient()