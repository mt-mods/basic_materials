-- Basic materials mod
-- by Vanessa Dannenberg

-- This mod supplies all those little random craft items that everyone always
-- seems to need, such as metal bars (ala rebar), plastic, wire, and so on.

local modpath = minetest.get_modpath("basic_materials")

basic_materials = {}
basic_materials.mod = { author = "Vanessa Dannenberg" }

dofile(modpath .. "/nodes.lua")
dofile(modpath .. "/craftitems.lua")
dofile(modpath .. "/crafts.lua")
dofile(modpath .. "/aliases.lua")