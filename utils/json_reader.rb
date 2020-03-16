require 'json'

# Method to get a Json Object.
# param1: String Path of Json.
# Return: json object
def openJsonFile(filepath)
    $file = File.open filepath
    $jsonObjectMain = JSON.load $file
    return $jsonObjectMain
end

# Method to get the value of the key.
# param1: key.
# Return: json object
def getJsonValue(key)
    return $jsonObjectMain[key]
end

# Method to get the value of the key.
# param1: JsonObject.
# param1: key.
# Return: json object.
def getJsonValueFromJsonObject(jsonObject, key)
    return jsonObject[key]
end

# Method that return the actual JsonObject.
# Return: json object.
def getActualJsonObject()
    return $jsonObjectMain
end

# Method to parse from a string.
# param1: jsonString.
# Return: json object.
def parseJsonString(jsonString) 
    $jsonObjectMain = JSON.parse(jsonString);
    return $jsonObjectMain;
end

# openJsonFile("../users.json")
# adminUser = getJsonObject('admin_user')
# $jsonObjectMain = adminUser
# result = getJsonObject('email')
# puts "-----------------------"
# puts result
# puts $jsonObjectMain['admin_user']