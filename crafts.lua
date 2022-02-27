local materials = {
    dirt = "default:dirt",
    sand = "default:sand",
    gravel = "default:gravel",
    copper_ingot = "default:copper_ingot",
    steel_ingot = "default:steel_ingot",
    gold_ingot = "default:gold_ingot",
    tin_ingot = "default:tin_ingot",
    mese_crystal_fragment = "default:mese_crystal_fragment",
    torch = "default:torch",
    diamond = "default:diamond",
    clay_lump = "default:clay_lump",
    water_bucket = "bucket:bucket_water",
    empty_bucket = "bucket:bucket_empty",
    dye_dark_grey = "dye:dark_grey",
}

if minetest.get_modpath("mcl_core") then
    materials = {
        dirt = "mcl_core:dirt",
        sand = "mcl_core:sand",
        gravel = "mcl_core:gravel",
        steel_ingot = "mcl_core:iron_ingot",
        gold_ingot = "mcl_core:gold_ingot",
        mese_crystal_fragment = "mesecons:redstone",
        torch = "mcl_torches:torch",
        diamond = "mcl_core:diamond",
        clay_lump = "mcl_core:clay_lump",
        water_bucket = "mcl_buckets:bucket_water",
        empty_bucket = "mcl_buckets:bucket_empty",
        dye_dark_grey = "mcl_dye:dark_grey",
        --use iron where no equivalent
        copper_ingot = "mcl_core:iron_ingot",
        tin_ingot = "mcl_core:iron_ingot",
        silver_ingot = "mcl_core:iron_ingot",
    }
elseif minetest.get_modpath("fl_ores") and minetest.get_modpath("fl_stone") then
    materials = {
        dirt = "fl_topsoil:dirt",
        sand = "fl_stone:sand",
        gravel = "fl_topsoil:gravel",
        steel_ingot = "fl_ores:iron_ingot",
        gold_ingot = "fl_ores:gold_ingot",
        mese_crystal_fragment = "fl_ores:iron_ingot",
        torch = "fl_light_sources:torch",
        diamond = "fl_ores:diamond",
        clay_lump = "fl_bricks:clay_lump",
        water_bucket = "fl_liquids:water_source",
        empty_bucket = "air",
        dye_dark_grey = "fl_dyes:dark_grey_dye",
        copper_ingot = "fl_ores:copper_ingot",
        tin_ingot = "fl_ores:tin_ingot",
        silver_ingot = "fl_ores:iron_ingot",
    }
end

--craft recipes
minetest.register_craft({
	output = "basic_materials:chainlink_brass 12",
	recipe = {
		{"", "basic_materials:brass_ingot", "basic_materials:brass_ingot"},
		{ "basic_materials:brass_ingot", "", "basic_materials:brass_ingot" },
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "" },
	},
})

minetest.register_craft({
	output = 'basic_materials:chain_steel 2',
	recipe = {
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"}
	}
})

minetest.register_craft({
	output = 'basic_materials:chain_brass 2',
	recipe = {
		{"basic_materials:chainlink_brass"},
		{"basic_materials:chainlink_brass"},
		{"basic_materials:chainlink_brass"}
	}
})

minetest.register_craft( {
	type = "shapeless",
	output = "basic_materials:brass_ingot 9",
	recipe = { "basic_materials:brass_block" },
})

minetest.register_craft( {
	output = "basic_materials:brass_block",
	recipe = {
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "basic_materials:brass_ingot" },
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "basic_materials:brass_ingot" },
		{ "basic_materials:brass_ingot", "basic_materials:brass_ingot", "basic_materials:brass_ingot" },
	},
})

minetest.register_craft( {
    output = "basic_materials:plastic_strip 9",
    recipe = {
		{ "basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet" }
    },
})

minetest.register_craft( {
	output = "basic_materials:empty_spool 3",
	recipe = {
		{ "basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet" },
		{ "", "basic_materials:plastic_sheet", "" },
		{ "basic_materials:plastic_sheet", "basic_materials:plastic_sheet", "basic_materials:plastic_sheet" }
	},
})

minetest.register_craft({
	type = "shapeless",
	output = "basic_materials:oil_extract 2",
	recipe = {"group:leaves", "group:leaves", "group:leaves", "group:leaves", "group:leaves", "group:leaves"}
})

--cooking recipes
minetest.register_craft({
	type = "cooking",
	output = "basic_materials:plastic_sheet",
	recipe = "basic_materials:paraffin",
})

minetest.register_craft({
	type = "cooking",
	output = "basic_materials:paraffin",
	recipe = "basic_materials:oil_extract",
})

minetest.register_craft({
	type = "cooking",
	output = "basic_materials:cement_block",
	recipe = "basic_materials:wet_cement",
	cooktime = 8
})

--fuel recipes
minetest.register_craft({
	type = "fuel",
	recipe = "basic_materials:plastic_sheet",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "basic_materials:oil_extract",
	burntime = 30,
})

minetest.register_craft({
	type = "fuel",
	recipe = "basic_materials:paraffin",
	burntime = 30,
})

minetest.register_craft({
    output = 'basic_materials:concrete_block 6',
    recipe = {
        {'group:sand',                'basic_materials:wet_cement', materials.gravel},
        {'basic_materials:steel_bar', 'basic_materials:wet_cement', 'basic_materials:steel_bar'},
        {materials.gravel,            'basic_materials:wet_cement', 'group:sand'},
    }
})

minetest.register_craft( {
    output = "basic_materials:motor 2",
    recipe = {
        { materials.mese_crystal_fragment, "basic_materials:copper_wire", "basic_materials:plastic_sheet" },
        { materials.copper_ingot,          materials.steel_ingot,         materials.steel_ingot },
        { materials.mese_crystal_fragment, "basic_materials:copper_wire", "basic_materials:plastic_sheet" }
    },
    replacements = {
        { "basic_materials:copper_wire", "basic_materials:empty_spool" },
        { "basic_materials:copper_wire", "basic_materials:empty_spool" },
    }
})

minetest.register_craft( {
    output = "basic_materials:heating_element 2",
    recipe = {
        { materials.copper_ingot, materials.mese_crystal_fragment, materials.copper_ingot }
    },
})

minetest.register_craft({
    --type = "shapeless",
    output = "basic_materials:energy_crystal_simple 2",
    recipe = {
        { materials.mese_crystal_fragment, materials.torch, materials.mese_crystal_fragment },
        { materials.diamond, materials.gold_ingot, materials.diamond }
    },
})

minetest.register_craft( {
    output = "basic_materials:copper_wire 2",
    type = "shapeless",
    recipe = {
        materials.copper_ingot,
        "basic_materials:empty_spool",
        "basic_materials:empty_spool",
    },
})

minetest.register_craft( {
    output = "basic_materials:gold_wire 2",
    type = "shapeless",
    recipe = {
        materials.gold_ingot,
        "basic_materials:empty_spool",
        "basic_materials:empty_spool",
    },
})

minetest.register_craft( {
    output = "basic_materials:steel_wire 2",
    type = "shapeless",
    recipe = {
        materials.steel_ingot,
        "basic_materials:empty_spool",
        "basic_materials:empty_spool",
    },
})

minetest.register_craft( {
    output = "basic_materials:steel_strip 12",
    recipe = {
        { "", materials.steel_ingot, "" },
        { materials.steel_ingot, "", "" },
    },
})

minetest.register_craft( {
    output = "basic_materials:copper_strip 12",
    recipe = {
        { "", materials.copper_ingot, "" },
        { materials.copper_ingot, "", "" },
    },
})

minetest.register_craft( {
    output = "basic_materials:steel_bar 6",
    recipe = {
        { "", "", materials.steel_ingot },
        { "", materials.steel_ingot, "" },
        { materials.steel_ingot, "", "" },
    },
})

minetest.register_craft( {
    output = "basic_materials:padlock 2",
    recipe = {
        { "basic_materials:steel_bar" },
        { materials.steel_ingot },
        { materials.steel_ingot },
    },
})

minetest.register_craft({
    output = "basic_materials:chainlink_steel 12",
    recipe = {
        {"", materials.steel_ingot, materials.steel_ingot},
        { materials.steel_ingot, "", materials.steel_ingot },
        { materials.steel_ingot, materials.steel_ingot, "" },
    },
})

minetest.register_craft( {
    output = "basic_materials:gear_steel 6",
    recipe = {
        { "", materials.steel_ingot, "" },
        { materials.steel_ingot,"basic_materials:chainlink_steel", materials.steel_ingot },
        { "", materials.steel_ingot, "" }
    },
})

--i3 does has issues in its craft override with replacements
if not minetest.get_modpath("i3") then
    minetest.register_craft( {
        type = "shapeless",
        output = "basic_materials:terracotta_base 8",
        recipe = {
            materials.bucket_water,
            materials.clay_lump,
            materials.gravel,
        },
        replacements = {{materials.bucket_water, materials.bucket_empty}},
    })

    minetest.register_craft({
        type = "shapeless",
        output = "basic_materials:wet_cement 3",
        recipe = {
            materials.dirt,
            materials.dark_grey,
            materials.dark_grey,
            materials.dark_grey,
            materials.bucket_water
        },
        replacements = {{materials.bucket_water, materials.bucket_empty}},
    })
end

minetest.register_craft( {
    output = "mesecons_materials:silicon 4",
    recipe = {
        { materials.sand, materials.sand },
        { materials.sand, materials.steel_ingot },
    },
})

minetest.register_craft( {
    output = "basic_materials:ic 4",
    recipe = {
        { "mesecons_materials:silicon", "mesecons_materials:silicon" },
        { "mesecons_materials:silicon", materials.copper_ingot },
    },
})

-- Without moreores, there still should be a way to create brass.
minetest.register_craft( {
    output = "basic_materials:brass_ingot 9",
    recipe = {
    {materials.copper_ingot, materials.tin_ingot, materials.copper_ingot},
    {materials.gold_ingot, materials.copper_ingot, materials.tin_ingot},
    {materials.copper_ingot, materials.tin_ingot, materials.copper_ingot},
    },
})

minetest.register_craft( {
    output = "basic_materials:silver_wire 2",
    type = "shapeless",
    recipe = {
        "moreores:silver_ingot",
        "basic_materials:empty_spool",
        "basic_materials:empty_spool",
    },
})

minetest.register_craft( {
    type = "shapeless",
    output = "basic_materials:brass_ingot 3",
    recipe = {
        materials.copper_ingot,
        materials.copper_ingot,
        materials.silver_ingot,
    },
})