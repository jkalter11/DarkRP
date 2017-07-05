local version = require("resources/darkrp/version")

-- check version
print("DarkRP - Version : "..version)
PerformHttpRequest("https://raw.githubusercontent.com/RyUkApples/DarkRP/master/darkrp/version.lua",function(err,text,headers)
  if err == 0 then
    text = string.gsub(text,"return ","")
    local r_version = tonumber(text)
    if version ~= r_version then
      print("WARNING: A new version is available here https://github.com/RyUkApples/DarkRP, update to benefit from the last features and to fix exploits/bugs.")
    end
  else
    print("Unable to check the remote version")
  end
end, "GET", "")