require 'net/http'
require 'httparty'
# require 'openssl'
require_relative '../json_reader.rb'

# ENVIRONMENTPATH = './environments.json'
ENVIRONMENTPATH = '../../environments.json'


USERPATH = 'users.json'
APIENDPOINT = 'api/data/v9.1'
ACCOUNTS = '/accounts'
$host = ''
TOKEN = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsIng1dCI6InBpVmxsb1FEU01LeGgxbTJ5Z3FHU1ZkZ0ZwQSIsImtpZCI6InBpVmxsb1FEU01LeGgxbTJ5Z3FHU1ZkZ0ZwQSJ9.eyJhdWQiOiJodHRwczovL2NhbWFjaG84LmFwaS5jcm0uZHluYW1pY3MuY29tLyIsImlzcyI6Imh0dHBzOi8vc3RzLndpbmRvd3MubmV0LzhlYTg1MDUyLTFmZWMtNGNjZC05ODU4LTQzYzcyOTc2MDEzOC8iLCJpYXQiOjE1Nzg5NjU0MjMsIm5iZiI6MTU3ODk2NTQyMywiZXhwIjoxNTc4OTY5MzIzLCJhY3IiOiIxIiwiYWlvIjoiNDJOZ1lPaitjeSs3UU43c3RuK1Q1WHVWTFNmS0x2ejdLU1pYcmJqYTE4c3FiN2FkeW5RQSIsImFtciI6WyJwd2QiXSwiYXBwaWQiOiI1MWY4MTQ4OS0xMmVlLTRhOWUtYWFhZS1hMjU5MWY0NTk4N2QiLCJhcHBpZGFjciI6IjAiLCJmYW1pbHlfbmFtZSI6IlNvcmlhIiwiZ2l2ZW5fbmFtZSI6IkFsYmVydG8iLCJpcGFkZHIiOiIxODEuMTg4LjE2Mi4xMTEiLCJuYW1lIjoiQWxiZXJ0byBTb3JpYSIsIm9pZCI6IjIxNzg4OGUxLTY2NjEtNDM1Zi04NzFlLWNjNjI1MDU0MDhhMSIsInB1aWQiOiIxMDAzMjAwMDk1NzgyNzdDIiwic2NwIjoidXNlcl9pbXBlcnNvbmF0aW9uIiwic3ViIjoiMGRXQXpVQWMwZkJ1Y196MTlJTkZQS3l6ZERKaGZFaGc2NlNwU1B3VkJaMCIsInRpZCI6IjhlYTg1MDUyLTFmZWMtNGNjZC05ODU4LTQzYzcyOTc2MDEzOCIsInVuaXF1ZV9uYW1lIjoiY2FybG9zODg4MkBjYW1hY2hvOC5vbm1pY3Jvc29mdC5jb20iLCJ1cG4iOiJjYXJsb3M4ODgyQGNhbWFjaG84Lm9ubWljcm9zb2Z0LmNvbSIsInV0aSI6IkVGTXpESG4wODBpbnEyVWh4Z1RSQUEiLCJ2ZXIiOiIxLjAiLCJ3aWRzIjpbIjYyZTkwMzk0LTY5ZjUtNDIzNy05MTkwLTAxMjE3NzE0NWUxMCJdfQ.Kp1zWqkT-JbjUDOgj8u4hk2Oe1N3w3F5EgRZ4Vg3scpJxcxkBG7JEobcKgXPJHWEPYqK5aqcwm2drnwICwRxtcZLflNKTzOSKecqbOCgHKu6Ryab7Hdh_4wkPEIH3WQenKGd5CTftaHe_yDNj9_q8huCACIpAh3GrzGKazHVjrHrW78rqYUUWN5MPiu9l7Y254kKCskZsH8J-stDPEQYxk5ZDrRLnuEtmJdayVBoo5JBG8AYPMEWuQTGOoo5LcKy49oe36NwzvLiuKkUT7GsFtUPj5ErHQwUZJsi1FE6hc4lGWFlp_kiSP06CvkHgvtv_xzaKcXgsYVXDjyPMO6ugg'

# response = HTTParty.get('http://google.com')
# response.code
# puts response.code
# # 200
# response.body
# puts response.body
# # ...



def getEnvironment()
    json = openJsonFile(ENVIRONMENTPATH)
    dynamicJson = getJsonValueFromJsonObject(json,'dynamic360')
    return getJsonValueFromJsonObject(dynamicJson, 'baseurl')
end

def getApiEnvironment()
    json = openJsonFile(ENVIRONMENTPATH)
    dynamicJson = getJsonValueFromJsonObject(json,'dynamic360')
    return getJsonValueFromJsonObject(dynamicJson, 'apiurl')
end

def getEmail(userType)
    json = openJsonFile(USERPATH)
    adminUser = getJsonValueFromJsonObject(json, userType)
    return getJsonValueFromJsonObject(adminUser, 'email')
end

def getPassword(userType)
    json = openJsonFile(USERPATH)
    adminUser = getJsonValueFromJsonObject(json, userType)
    return getJsonValueFromJsonObject(adminUser, 'password')
end

def accountsAPI()
    return  getApiEnvironment() + APIENDPOINT.concat(ACCOUNTS) 
end

def setHost()
    if $host == ''
        $host = getEnvironment()
    end
end

def generalRequest()
    uri = URI.parse(accountsAPI())
    response = HTTParty.get(uri, :headers => { "Authorization" => "Bearer #{TOKEN}"}, :verify => false)
    puts response
end

def getRequest(body)
    uri = URI.parse(accountsAPI())
    response = HTTParty.get(uri, :headers => { "Authorization" => "Bearer #{TOKEN}"}, :verify => false)
    puts response
end

def postRequest(path, body)

end

def deleteRequest(id)
    uri = URI.parse(accountsAPI().concat("(#{id})"))
    puts uri
    response = HTTParty.delete(uri, :headers => {"Authorization" => "Bearer #{TOKEN}"}, :verify => false)
    puts response.code
    puts response.body
end

def postAccount(accountName)
    uri = URI.parse(accountsAPI())
    response = HTTParty.post(uri, :headers => { "Authorization" => "Bearer #{TOKEN}",
                                                "Content-Type" => "application/json"}, 
                                    :verify => false,
        :body => "{\"name\":\"#{accountName}\",\"msdyn_travelchargetype\":690970003,\"msdyn_taxexempt\":false,\"creditonhold\":false,\"donotpostalmail\":false,\"donotfax\":false,\"donotphone\":false,\"donotbulkemail\":false,\"donotemail\":false,\"preferredcontactmethodcode\":1,\"transactioncurrencyid@odata.bind\":\"/transactioncurrencies(850d61d3-6234-ea11-a813-000d3a35b14a)\",\"statuscode\":1,\"statecode\":0,\"ownerid@odata.bind\":\"/systemusers(3949883e-fed5-4165-b07e-225026815c0b)\"}")
    # puts response
    puts response.code
end

# postAccount('CarlosAccount')
# deleteRequest("680b160f-6f36-ea11-a813-000d3a339ac5")