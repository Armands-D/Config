local awful = require("awful") 
local wibox = require("wibox")

wifi_widget = wibox.widget {
  align = 'center',
  valign = 'center',
  widget = wibox.widget.textbox
}

local device_name = "wlo1"
local cmd_str = string.format("nmcli device show %s", device_name)

awful.widget.watch(
  cmd_str,
  10,
  function(widget, stdout)
    local connection_str = ""
    local count = 0
    for s in string.gmatch(stdout, "[^\n]+")do
      count = count + 1
      connection_str = s
      -- Connection name is the 6th split line
      if count == 6 then break end
    end
    local last_index = string.len(connection_str)
    -- Name of connection start at this index
    local start_index = 41
    widget:set_text(string.sub(connection_str, start_index, last_index))
  end,
  wifi_widget
)

return wifi_widget
