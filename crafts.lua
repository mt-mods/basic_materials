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
	output = "basic_materials:chain_steel 2",
	recipe = {
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"},
		{"basic_materials:chainlink_steel"}
	}
})

minetest.register_craft({
	output = "basic_materials:chain_brass 2",
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
        output = "basic_materials:concrete_block 6",
        recipe = {
            {"group:sand",                "basic_materials:wet_cement", bm.gameconfig_gravel},
            {"basic_materials:steel_bar", "basic_materials:wet_cement", "basic_materials:steel_bar"},
            {bm.gameconfig_gravel,            "basic_materials:wet_cement", "group:sand"},
        }
    })

    minetest.register_craft( {
        output = "basic_materials:motor 2",
        recipe = {
            { bm.gameconfig_mese_crystal_fragment, "basic_materials:copper_wire", "basic_materials:plastic_sheet" },
            { bm.gameconfig_copper_ingot,          bm.gameconfig_steel_ingot,         bm.gameconfig_steel_ingot },
            { bm.gameconfig_mese_crystal_fragment, "basic_materials:copper_wire", "basic_materials:plastic_sheet" }
        },
        replacements = {
            { "basic_materials:copper_wire", "basic_materials:empty_spool" },
            { "basic_materials:copper_wire", "basic_materials:empty_spool" },
        }
    })

    minetest.register_craft( {
        output = "basic_materials:heating_element 2",
        recipe = {
            { bm.gameconfig_copper_ingot, bm.gameconfig_mese_crystal_fragment, bm.gameconfig_copper_ingot }
        },
    })

    minetest.register_craft({
        --type = "shapeless",
        output = "basic_materials:energy_crystal_simple 2",
        recipe = {
            { bm.gameconfig_mese_crystal_fragment, bm.gameconfig_torch, bm.gameconfig_mese_crystal_fragment },
            { bm.gameconfig_diamond, bm.gameconfig_gold_ingot, bm.gameconfig_diamond }
        },
    })

    minetest.register_craft( {
        output = "basic_materials:copper_wire 2",
        type = "shapeless",
        recipe = {
            bm.gameconfig_copper_ingot,
            "basic_materials:empty_spool",
            "basic_materials:empty_spool",
        },
    })

    minetest.register_craft( {
        output = "basic_materials:gold_wire 2",
        type = "shapeless",
        recipe = {
            bm.gameconfig_gold_ingot,
            "basic_materials:empty_spool",
            "basic_materials:empty_spool",
        },
    })

    minetest.register_craft( {
        output = "basic_materials:steel_wire 2",
        type = "shapeless",
        recipe = {
            bm.gameconfig_steel_ingot,
            "basic_materials:empty_spool",
            "basic_materials:empty_spool",
        },
    })

    minetest.register_craft( {
        output = "basic_materials:steel_strip 12",
        recipe = {
            { "", bm.gameconfig_steel_ingot, "" },
            { bm.gameconfig_steel_ingot, "", "" },
        },
    })

    minetest.register_craft( {
        output = "basic_materials:copper_strip 12",
        recipe = {
            { "", bm.gameconfig_copper_ingot, "" },
            { bm.gameconfig_copper_ingot, "", "" },
        },
    })

    minetest.register_craft( {
        output = "basic_materials:steel_bar 6",
        recipe = {
            { "", "", bm.gameconfig_steel_ingot },
            { "", bm.gameconfig_steel_ingot, "" },
            { bm.gameconfig_steel_ingot, "", "" },
        },
    })

    minetest.register_craft( {
        output = "basic_materials:padlock 2",
        recipe = {
            { "basic_materials:steel_bar" },
            { bm.gameconfig_steel_ingot },
            { bm.gameconfig_steel_ingot },
        },
    })

    minetest.register_craft({
        output = "basic_materials:chainlink_steel 12",
        recipe = {
            {"", bm.gameconfig_steel_ingot, bm.gameconfig_steel_ingot},
            { bm.gameconfig_steel_ingot, "", bm.gameconfig_steel_ingot },
            { bm.gameconfig_steel_ingot, bm.gameconfig_steel_ingot, "" },
        },
    })

    minetest.register_craft( {
        output = "basic_materials:gear_steel 6",
        recipe = {
            { "", bm.gameconfig_steel_ingot, "" },
            { bm.gameconfig_steel_ingot,"basic_materials:chainlink_steel", bm.gameconfig_steel_ingot },
            { "", bm.gameconfig_steel_ingot, "" }
        },
    })


    minetest.register_craft( {
        type = "shapeless",
        output = "basic_materials:terracotta_base 8",
        recipe = {
            bm.gameconfig_water_bucket,
            bm.gameconfig_clay_lump,
            bm.gameconfig_gravel,
        },
        replacements = { {bm.gameconfig_water_bucket, bm.gameconfig_empty_bucket}, },
    })


    minetest.register_craft({
        type = "shapeless",
        output = "basic_materials:wet_cement 3",
        recipe = {
            bm.gameconfig_dirt,
            bm.gameconfig_dye_dark_grey,
            bm.gameconfig_dye_dark_grey,
            bm.gameconfig_dye_dark_grey,
            bm.gameconfig_water_bucket
        },
        replacements = {{bm.gameconfig_water_bucket, bm.gameconfig_empty_bucket},},
    })


    minetest.register_craft( {
        output = "basic_materials:silicon 4",
        recipe = {
            { bm.gameconfig_sand, bm.gameconfig_sand },
            { bm.gameconfig_sand, bm.gameconfig_steel_ingot },
        },
    })

    minetest.register_craft( {
        output = "basic_materials:ic 4",
        recipe = {
            { "basic_materials:silicon", "basic_materials:silicon" },
            { "basic_materials:silicon", bm.gameconfig_copper_ingot },
        },
    })


    if not minetest.get_modpath("moreores") then
        -- Without moreores, there still should be a way to create brass.
        minetest.register_craft( {
            output = "basic_materials:brass_ingot 9",
            recipe = {
            {bm.gameconfig_copper_ingot, bm.gameconfig_tin_ingot, bm.gameconfig_copper_ingot},
            {bm.gameconfig_gold_ingot, bm.gameconfig_copper_ingot, bm.gameconfig_gold_ingot},
            {bm.gameconfig_copper_ingot, bm.gameconfig_tin_ingot, bm.gameconfig_copper_ingot},
            },
        })

        minetest.register_craft( {
            output = "basic_materials:silver_wire 2",
            type = "shapeless",
            recipe = {
                bm.gameconfig_silver_ingot,
                "basic_materials:empty_spool",
                "basic_materials:empty_spool",
            },
        })
    elseif minetest.get_modpath("moreores") then
        minetest.register_craft( {
            type = "shapeless",
            output = "basic_materials:brass_ingot 3",
            recipe = {
                bm.gameconfig_copper_ingot,
                bm.gameconfig_copper_ingot,
                "moreores:silver_ingot",
            },
        })
    end


