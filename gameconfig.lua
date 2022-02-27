-- Craft ingredients


bm = {}
-- MineClone2 support
local mod_mcl_core = minetest.get_modpath("mcl_core") ~= nil
if mod_mcl_core then
	bm.gameconfig_dirt = "mcl_core:dirt"
	bm.gameconfig_sand = "mcl_core:sand"
	bm.gameconfig_gravel = "mcl_core:gravel"
	bm.gameconfig_steel_ingot = "mcl_core:iron_ingot"
	bm.gameconfig_gold_ingot = "mcl_core:gold_ingot"
	bm.gameconfig_mese_crystal_fragment = "mesecons:redstone"
	bm.gameconfig_torch = "mcl_torches:torch"
	bm.gameconfig_diamond = "mcl_core:diamond"
	bm.gameconfig_clay_lump = "mcl_core:clay_lump"
	bm.gameconfig_water_bucket = "mcl_buckets:bucket_water"
	bm.gameconfig_empty_bucket = "mcl_buckets:bucket_empty"
	bm.gameconfig_dye_dark_grey = "mcl_dye:dark_grey"
	-- No current equivalent so default to iron ingot instead.
	bm.gameconfig_copper_ingot = "mcl_core:iron_ingot"
	bm.gameconfig_tin_ingot = "mcl_core:iron_ingot"
	bm.gameconfig_silver_ingot = "mcl_core:iron_ingot"
else --fallback to Minetest Game's items.
	bm.gameconfig_dirt = "default:dirt"
	bm.gameconfig_sand = "default:sand"
	bm.gameconfig_gravel = "default:gravel"
	bm.gameconfig_copper_ingot = "default:copper_ingot"
	bm.gameconfig_steel_ingot = "default:steel_ingot"
	bm.gameconfig_gold_ingot = "default:gold_ingot"
	bm.gameconfig_tin_ingot = "default:tin_ingot"
	bm.gameconfig_mese_crystal_fragment = "default:mese_crystal_fragment"
	bm.gameconfig_torch = "default:torch"
	bm.gameconfig_diamond = "default:diamond"
	bm.gameconfig_clay_lump = "default:clay_lump"
	bm.gameconfig_water_bucket = "bucket:bucket_water"
	bm.gameconfig_empty_bucket = "bucket:bucket_empty"
	bm.gameconfig_dye_dark_grey = "dye:dark_grey"
	-- No current equivalent so default to copper ingot instead.
	bm.gameconfig_silver_ingot = "default:copper_ingot"
end


-- Sounds
-- Integrate wsor4035's MIT licensed sound_api
--[[
MIT Copyright 2021 wsor4035

Permission is hereby granted, free of charge, to any person obtaining a copy of
this software and associated documentation files (the "Software"), to deal in
the Software without restriction, including without limitation the rights to
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
the Software, and to permit persons to whom the Software is furnished to do so,
subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

local sound_api = {}

--convert some games for api usage

--ks_sounds conversion
--currently loggy and bedrock are ignored
local ks = {}

function ks.node_sound_defaults(table)
	table = table or {}
	table.footstep = table.footstep or ks_sounds.generalnode_sounds.footstep
	table.dug = table.dug or ks_sounds.generalnode_sounds.dug
    table.dig = table.dig or ks_sounds.generalnode_sounds.dig
	table.place = table.place or ks_sounds.generalnode_sounds.place
	return table
end

function ks.node_sound_wood_defaults(table)
	table = table or {}
	table.footstep = table.footstep or ks_sounds.woodennode_sounds.footstep
	table.dug = table.dug or ks_sounds.woodennode_sounds.dug
    table.dig = table.dig or ks_sounds.woodennode_sounds.dig
	table.place = table.place or ks_sounds.woodennode_sounds.place
	ks.node_sound_defaults(table)
	return table
end

function ks.node_sound_leaves_defaults(table)
	table = table or {}
	table.footstep = table.footstep or ks_sounds.leafynode_sounds.footstep
	table.dug = table.dug or ks_sounds.leafynode_sounds.dug
    table.dig = table.dig or ks_sounds.leafynode_sounds.dig
	table.place = table.place or ks_sounds.leafynode_sounds.place
	ks.node_sound_defaults(table)
	return table
end

function ks.node_sound_snow_defaults(table)
	table = table or {}
	table.footstep = table.footstep or ks_sounds.snowynode_sounds.footstep
	table.dug = table.dug or ks_sounds.snowynode_sounds.dug
    table.dig = table.dig or ks_sounds.snowynode_sounds.dig
	table.place = table.place or ks_sounds.snowynode_sounds.place
	ks.node_sound_defaults(table)
	return table
end


--api
function sound_api.node_sound_default(table)
    if minetest.get_modpath("default") then
        return default.node_sound_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_defaults(table)
    elseif minetest.get_modpath("ks_sounds") then
        return ks.node_sound_default(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_default(table)
    else
        return table
    end
end

function sound_api.node_sound_stone_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_stone_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_stone_defaults(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_stone_defaults(table)
    elseif minetest.get_modpath("fl_stone") then
        return fl_stone.sounds.stone(table)
    else
        return table
    end
end

function sound_api.node_sound_dirt_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_dirt_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_dirt_defaults(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_dirt_defaults(table)
    --s/dirt/grass
    elseif minetest.get_modpath("fl_topsoil") then
        return fl_topsoil.sounds.grass(table)
    else
        return table
    end
end

--return dirt as some games use dirt vs grass
function sound_api.node_sound_grass_defaults(table)
    return sound_api.node_sound_dirt_defaults(table)
end

function sound_api.node_sound_sand_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_sand_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_sand_defaults(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_sand_defaults(table)
    elseif minetest.get_modpath("fl_stone") then
        return fl_stone.sounds.sand(table)
    else
        return table
    end
end

function sound_api.node_sound_gravel_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_gravel_defaults(table)
    --s/gravel/sand
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_sand_defaults(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_gravel_defaults(table)
    elseif minetest.get_modpath("fl_topsoil") then
        return fl_topsoil.sounds.gravel(table)
    else
        return table
    end
end

function sound_api.node_sound_wood_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_wood_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_wood_defaults(table)
    elseif minetest.get_modpath("ks_sounds") then
        return ks.node_sound_wood_default(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_wood_defaults(table)
    elseif minetest.get_modpath("fl_trees") then
        return fl_trees.sounds.wood(table)
    else
        return table
    end
end

function sound_api.node_sound_leaves_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_leaves_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_leaves_defaults(table)
    elseif minetest.get_modpath("ks_sounds") then
        return ks.node_sound_leaves_default(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_leaves_defaults(table)
    else
        return table
    end
end

function sound_api.node_sound_glass_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_glass_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_glass_defaults(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_glass_defaults(table)
    else
        return table
    end
end


function sound_api.node_sound_ice_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_ice_defaults(table)
    --s/ice/glass
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_glass_defaults(table)
    --s/ice/glass
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_glass_defaults(table)
    else
        return table
    end
end

function sound_api.node_sound_metal_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_metal_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_metal_defaults(table)
    else
        return table
    end
end

function sound_api.node_sound_water_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_water_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_water_defaults(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_water_defaults(table)
    else
        return table
    end
end

function sound_api.node_sound_lava_defaults(table)
    --s/lava/water
    if minetest.get_modpath("default") then
        return default.node_sound_water_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_lava_defaults(table)
    --s/lava/water
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_water_defaults(table)
    else
        return table
    end
end

function sound_api.node_sound_snow_defaults(table)
    if minetest.get_modpath("default") then
        return default.node_sound_snow_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_snow_defaults(table)
    elseif minetest.get_modpath("ks_sounds") then
        return ks.node_sound_snow_default(table)
    elseif minetest.get_modpath("nodes_nature") then
        return nodes_nature.node_sound_snow_defaults(table)
    elseif minetest.get_modpath("fl_topsoil") then
        return fl_topsoil.sounds.snow(table)
    else
        return table
    end
end

function sound_api.node_sound_wool_defaults(table)
    --s/wool/default
    if minetest.get_modpath("default") then
        return default.node_sound_defaults(table)
    elseif minetest.get_modpath("mcl_sounds") then
        return mcl_sounds.node_sound_wool_defaults(table)
    else
        return table
    end
end

return sound_api
