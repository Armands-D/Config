local awful = require("awful")
local naughty = require("naughty")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local gfs = require("gears.filesystem")
local dpi = require('beautiful.xresources').apply_dpi

battery_widget = wibox.widget{
  align  = 'center',
  valign = 'center',
  widget = wibox.widget.textbox,
}

awful.widget.watch(
  "acpi -b",
  10,
  function (widget, stdout)
    -- split
    local split_table = {}
    for s in string.gmatch(stdout, "[^,]+") do
      table.insert(split_table, s)
    end
    widget:set_text(split_table[2])
  end,
  -- base widget
  battery_widget
)


return battery_widget
