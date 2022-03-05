local wibox = require("wibox")
local vicious = require("vicious")
-- My Widget Module
mywidgets = {}
local batt = wibox.widget.textbox()
batt.font = "Noto Mono 10"
local function get_batterystatus()
  -- Run command, write to tmp file
  local filedescriptor = io.popen("acpi")
  -- Reads full file
  local value = filedescriptor:read("*a")
  filedescriptor:close()
  -- Remove %, lua really doesn't like single % in strings
  value = value.gsub(value, "%%", "")
  -- Split the string
  local t = {}
  for str in string.gmatch(value, "([^"..",".."]+)") do
    table.insert(t, str)
  end
  -- Change to int
  n = tonumber(t[2]:sub(2))
  -- Check battery %
  if(string.find(value, "charging") == nil)then
    bat = ""
  elseif(n < 10)then
    bat = ""
  elseif(n < 25)then
    bat = ""
  elseif(n < 50)then
    bat = ""
  elseif(n < 75)then
    bat = ""
  else
    bat = ""
  end
  -- Return text value format
  value = " " .. bat .. " " .. n .. "%% "
  return {value}
end
vicious.register(batt, get_batterystatus, '$1', 60)

local wifi = wibox.widget.textbox()
wifi.font = "Noto Mono 10"
local function get_wifistatus()
  -- List device connections
  local command = "nmcli device | grep -E '*wifi * connected*'"
  local filedescriptor = io.popen(command)
  local result = filedescriptor:read("*a")
  filedescriptor:close()
  -- Get rid of varied spaces
  if(result ~= "")then
    -- Find where the index where connected starts
    index = string.find(result, "connected")
    -- Add 23 to index to skip "connected"
    name = string.sub(result, index + 23, -1)
    wifi_string = " " .. name
  else
    wifi_string = " Not Connected"
  end
  value = " " .. wifi_string .. " "
  return {value}
end
vicious.register(wifi, get_wifistatus, '$1', 10)

-- Check Audio
-- amixer | grep -E "Left: *Playback *[0-9]* \["

-- Add widgets to module
mywidgets.battery_widget = batt
mywidgets.wifi_widget = wifi
return mywidgets
