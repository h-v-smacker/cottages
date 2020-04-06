-- Boilerplate to support localized strings if intllib mod is installed.
local S = cottages.S

---------------------------------------------------------------------------------------
-- roof parts
---------------------------------------------------------------------------------------
-- a better roof than the normal stairs; can be replaced by stairs:stair_wood



-- create the three basic roof parts plus receipes for them;
cottages.register_roof = function( name, description, tiles, basic_material, homedecor_alternative )

   minetest.register_node("cottages:roof_"..name, {
		description = S(description) .. " " .. S("roof"),
		drawtype = "nodebox",
		--tiles = {cottages.textures_roof_wood,cottages.texture_roof_sides,cottages.texture_roof_sides,cottages.texture_roof_sides,cottages.texture_roof_sides,cottages.textures_roof_wood},
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, roof = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		is_ground_content = false,
	})
   
   
   minetest.register_node("cottages:roof_" .. name .. "_corner_inner", {
		description = S(description) .. " " .. S("roof (inner corner)"),
		drawtype = "nodebox",
		tiles = {	tiles[1], 
				tiles[2], 
				tiles[3],
				tiles[2] .. "^(" .. tiles[6] .. "^cottages_corner_inner_mask.png^[transformFX^[makealpha:255,255,255)",
				tiles[5], 
				tiles[2] .. "^(" .. tiles[6] .. "^cottages_corner_inner_mask.png^[makealpha:255,255,255)" },
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, roof = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.0, 0, 0},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{0, 0, 0, 0.5, 0.5, -0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.0, 0, 0},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
				{0, 0, 0, 0.5, 0.5, -0.5},
			},
		},
		is_ground_content = false,
	})
	
	 minetest.register_node("cottages:roof_" .. name .. "_corner_outer", {
		description = S(description) .. " " .. S("roof (outer corner)"),
		drawtype = "nodebox",
		tiles = {	tiles[1], 
				tiles[2], 
				tiles[1],
				tiles[2],
				tiles[2], 
				tiles[1] },
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, roof = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0},
				{-0.5, 0, 0, 0, 0.5, 0.5},
				{0, -0.5, 0, 0.5, 0, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0},
				{-0.5, 0, 0, 0, 0.5, 0.5},
				{0, -0.5, 0, 0.5, 0, 0.5},
			},
		},
		is_ground_content = false,
	})

   -- a better roof than the normal stairs; this one is for usage directly on top of walls (it has the form of a stair)
   minetest.register_node("cottages:roof_connector_"..name, {
		description = S(description) .. " " .. S("roof (connector)"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
		tiles = tiles,
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, roof = 1},
		node_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
				{-0.5, 0, 0, 0.5, 0.5, 0.5},
			},
		},
		is_ground_content = false,
	})

   -- this one is the slab version of the above roof
   minetest.register_node("cottages:roof_flat_"..name, {
		description = S(description) .. " " .. S("roof (flat)"),
		drawtype = "nodebox",
                -- top, bottom, side1, side2, inner, outer
                -- this one is from all sides - except from the underside - of the given material
		tiles = { tiles[1], tiles[2], tiles[1], tiles[1], tiles[1], tiles[1] };
		paramtype = "light",
		paramtype2 = "facedir",
		groups = {snappy = 2, choppy = 2, oddly_breakable_by_hand = 2, roof = 1},
		node_box = {
			type = "fixed",
			fixed = {	
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
		},
		selection_box = {
			type = "fixed",
			fixed = {
				{-0.5, -0.5, -0.5, 0.5, 0, 0.5},
			},
		},
		is_ground_content = false,
	})


	if( not( homedecor_alternative )
		or ( minetest.get_modpath("homedecor") ~= nil )) then

	minetest.register_craft({
	output = "cottages:roof_"..name.." 6",
	recipe = {
		{'', '', basic_material },
		{'', basic_material, '' },
		{basic_material, '', '' }
	}
      })
	end

	-- make those roof parts that use homedecor craftable without that mod
	if( homedecor_alternative ) then
	basic_material = 'cottages:roof_wood';

	minetest.register_craft({
	output = "cottages:roof_"..name.." 3",
	recipe = {
		{homedecor_alternative, '', basic_material },
		{'', basic_material, '' },
		{basic_material, '', '' }
	}
	})
	end

	minetest.register_craft({
		output = "cottages:roof_connector_"..name,
		recipe = {
			{'cottages:roof_'..name },
			{cottages.craftitem_wood },
		}
	})

	minetest.register_craft({
		output = "cottages:roof_"..name.."_corner_inner 3",
		recipe = {
			{'cottages:roof_'..name, 'cottages:roof_'..name},
			{'cottages:roof_'..name, '' },
		}
	})

	minetest.register_craft({
		output = "cottages:roof_"..name.." 3",
		recipe = {
			{"cottages:roof_"..name.."_corner_inner", "cottages:roof_"..name.."_corner_inner", "cottages:roof_"..name.."_corner_inner"}
		}
	})
   
	minetest.register_craft({
		output = "cottages:roof_"..name.."_corner_outer 3",
		recipe = {
			{'', 'cottages:roof_'..name},
			{'cottages:roof_'..name, 'cottages:roof_'..name },
		}
	})
   
	minetest.register_craft({
		output = "cottages:roof_"..name.." 3",
		recipe = {
			{"cottages:roof_"..name.."_corner_outer", "cottages:roof_"..name.."_corner_outer", "cottages:roof_"..name.."_corner_outer"}
		}
	})

	minetest.register_craft({
		output = "cottages:roof_flat_"..name..' 2',
		recipe = {
			{'cottages:roof_'..name, 'cottages:roof_'..name },
		}
	})

	-- convert flat roofs back to normal roofs
	minetest.register_craft({
		output = "cottages:roof_"..name,
		recipe = {
			{"cottages:roof_flat_"..name, "cottages:roof_flat_"..name }
		}
	})

end -- of cottages.register_roof( name, tiles, basic_material )




---------------------------------------------------------------------------------------
-- add the diffrent roof types
---------------------------------------------------------------------------------------
cottages.register_roof( 'straw', "Straw",
		{"cottages_darkage_straw.png","cottages_darkage_straw.png",
		"cottages_darkage_straw.png","cottages_darkage_straw.png",
		"cottages_darkage_straw.png","cottages_darkage_straw.png"},
		'cottages:straw_mat', nil );
cottages.register_roof( 'straw_dark', "Dark straw",
		{"cottages_dark_straw.png","cottages_dark_straw.png",
		"cottages_dark_straw.png","cottages_dark_straw.png",
		"cottages_dark_straw.png","cottages_dark_straw.png"},
		'cottages:straw_bale', nil );
cottages.register_roof( 'reet', "Reed",
		{"cottages_reet.png","cottages_reet.png",
		"cottages_reet.png","cottages_reet.png",
		"cottages_reet.png","cottages_reet.png"},
		cottages.craftitem_papyrus, nil );
cottages.register_roof( 'hay', "Hay",
		{cottages.straw_texture.."^[multiply:#88BB88",cottages.straw_texture.."^[multiply:#88BB88",
		cottages.straw_texture.."^[multiply:#88BB88",cottages.straw_texture.."^[multiply:#88BB88",
		cottages.straw_texture.."^[multiply:#88BB88",cottages.straw_texture.."^[multiply:#88BB88"},
		'cottages:hay_mat', nil );
cottages.register_roof( 'wood', "Wooden",
		{cottages.textures_roof_wood, cottages.texture_roof_sides,
		cottages.texture_roof_sides,  cottages.texture_roof_sides,
		cottages.texture_roof_sides,  cottages.textures_roof_wood},
		cottages.craftitem_wood, nil);
cottages.register_roof( 'black', "Asphalt",
		{"cottages_homedecor_shingles_asphalt.png", cottages.texture_roof_sides,
		cottages.texture_roof_sides, cottages.texture_roof_sides,
		cottages.texture_roof_sides, "cottages_homedecor_shingles_asphalt.png"},
		'homedecor:shingles_asphalt', cottages.craftitem_coal_lump);
cottages.register_roof( 'red', "Terracotta",
		{"cottages_homedecor_shingles_terracotta.png", cottages.texture_roof_sides,
		cottages.texture_roof_sides, cottages.texture_roof_sides,
		cottages.texture_roof_sides, "cottages_homedecor_shingles_terracotta.png"},
		'homedecor:shingles_terracotta', cottages.craftitem_clay_brick);
cottages.register_roof( 'brown', "Brown shingle",
		{"cottages_homedecor_shingles_wood.png", cottages.texture_roof_sides,
		cottages.texture_roof_sides, cottages.texture_roof_sides,
		cottages.texture_roof_sides, "cottages_homedecor_shingles_wood.png"},
		'homedecor:shingles_wood', cottages.craftitem_dirt);
cottages.register_roof( 'slate', "Slate",
		{"cottages_slate.png", cottages.texture_roof_sides,
		"cottages_slate.png", "cottages_slate.png",
		cottages.texture_roof_sides,"cottages_slate.png"},
		cottages.craftitem_stone, nil);
cottages.register_roof( 'shingle', "Shingle",
		{"cottages_homedecor_shingles_misc_wood.png", cottages.texture_roof_sides,
		cottages.texture_roof_sides, cottages.texture_roof_sides,
		cottages.texture_roof_sides, "cottages_homedecor_shingles_misc_wood.png"},
		'cottages:wood_flat', nil);

---------------------------------------------------------------------------------------
-- slate roofs are sometimes on vertical fronts of houses
---------------------------------------------------------------------------------------
		
-- minetest.register_alias("cottages:roof_vertical_slate", "cottages:slate_vertical")
		
minetest.register_node("cottages:slate_vertical", {
	description = S("Vertical slate"),
	tiles = {"cottages_slate.png", cottages.texture_roof_sides, 
               "cottages_slate.png", "cottages_slate.png", 
               cottages.texture_roof_sides, "cottages_slate.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2, roof = 1},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
})

minetest.register_craft({
	output = "cottages:slate_vertical 2",
	recipe = {{ cottages.craftitem_stone, cottages.craftitem_wood, '' }}
});

cottages.derive_blocks( "cottages", "slate_vertical", "Slate", "cottages_slate.png", {cracky = 2, roof = 1} )


---------------------------------------------------------------------------------------
-- asphalt roof: sawable block
---------------------------------------------------------------------------------------
minetest.register_node("cottages:roof_vertical_asphalt", {
	description = S("Vertical asphalt roof"),
	tiles = {"cottages_homedecor_shingles_asphalt.png", cottages.texture_roof_sides, 
               "cottages_homedecor_shingles_asphalt.png", "cottages_homedecor_shingles_asphalt.png", 
               cottages.texture_roof_sides, "cottages_homedecor_shingles_asphalt.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2, roof = 1},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
})

minetest.register_craft({
	output = "cottages:roof_vertical_asphalt 3",
	recipe = {{ cottages.craftitem_stone, cottages.craftitem_wood, cottages.craftitem_coal_lump }}
});

cottages.derive_blocks( "cottages", "roof_vertical_asphalt", "Asphalt", "cottages_homedecor_shingles_asphalt.png", {cracky = 2, roof = 1} )



---------------------------------------------------------------------------------------
-- terracota roof: sawable block
---------------------------------------------------------------------------------------
minetest.register_node("cottages:roof_vertical_terracotta", {
	description = S("Vertical terracotta roof"),
	tiles = {"cottages_homedecor_shingles_terracotta.png", cottages.texture_roof_sides, 
               "cottages_homedecor_shingles_terracotta.png", "cottages_homedecor_shingles_terracotta.png", 
               cottages.texture_roof_sides, "cottages_homedecor_shingles_terracotta.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2, roof = 1},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
})

minetest.register_craft({
	output = "cottages:roof_vertical_terracotta 3",
	recipe = {{ cottages.craftitem_stone, cottages.craftitem_wood, cottages.craftitem_clay_brick }}
});

cottages.derive_blocks( "cottages", "roof_vertical_terracotta", "Terracotta", "cottages_homedecor_shingles_terracotta.png", {cracky = 2, roof = 1} )



---------------------------------------------------------------------------------------
-- wooden roof: sawable block
---------------------------------------------------------------------------------------
minetest.register_node("cottages:roof_vertical_wood", {
	description = S("Vertical wooden roof"),
	tiles = {cottages.textures_roof_wood, cottages.texture_roof_sides, 
               cottages.textures_roof_wood, cottages.textures_roof_wood, 
               cottages.texture_roof_sides, cottages.textures_roof_wood},
	paramtype2 = "facedir",
	groups = {cracky = 2, roof = 1},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
})

minetest.register_craft({
	output = "cottages:roof_vertical_wood 3",
	recipe = {{ cottages.craftitem_stone, cottages.craftitem_wood, "group:tree" }}
});

cottages.derive_blocks( "cottages", "roof_vertical_wood", "Wooden", cottages.textures_roof_wood, {cracky = 2, roof = 1} )



---------------------------------------------------------------------------------------
-- brown shingles roof: sawable block
---------------------------------------------------------------------------------------
minetest.register_node("cottages:roof_vertical_brown", {
	description = S("Vertical brown shingle roof"),
	tiles = {"cottages_homedecor_shingles_wood.png", cottages.texture_roof_sides, 
               "cottages_homedecor_shingles_wood.png", "cottages_homedecor_shingles_wood.png", 
               cottages.texture_roof_sides, "cottages_homedecor_shingles_wood.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2, roof = 1},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
})

minetest.register_craft({
	output = "cottages:roof_vertical_brown 3",
	recipe = {{ cottages.craftitem_stone, cottages.craftitem_wood, cottages.craftitem_dirt }}
});

cottages.derive_blocks( "cottages", "roof_vertical_brown", "Brown shingle", "cottages_homedecor_shingles_wood.png", {cracky = 2, roof = 1} )



---------------------------------------------------------------------------------------
-- assorted shingles roof: sawable block
---------------------------------------------------------------------------------------
minetest.register_node("cottages:roof_vertical_shingle", {
	description = S("Vertical shingle roof"),
	tiles = {"cottages_homedecor_shingles_misc_wood.png", cottages.texture_roof_sides, 
               "cottages_homedecor_shingles_misc_wood.png", "cottages_homedecor_shingles_misc_wood.png", 
               cottages.texture_roof_sides, "cottages_homedecor_shingles_misc_wood.png"},
	paramtype2 = "facedir",
	groups = {cracky = 2, roof = 1},
	sounds = default.node_sound_stone_defaults(),
	is_ground_content = false,
})

-- minetest.register_craft({
-- 	output = "cottages:roof_vertical_shingle",
-- 	recipe = { {"cottages:wood_flat", "cottages:wood_flat"},
-- 	           {"cottages:wood_flat", "cottages:wood_flat"},
-- 	},
-- })

minetest.register_craft({
	output = "cottages:roof_vertical_shingle 2",
	recipe = {{ cottages.craftitem_wood, "cottages:wood_flat" }}
});
     
cottages.derive_blocks( "cottages", "roof_vertical_shingle", "Shingle", "cottages_homedecor_shingles_misc_wood.png", {cracky = 2, roof = 1} )


---------------------------------------------------------------------------------------
-- Reed might also be needed as a full block
---------------------------------------------------------------------------------------
minetest.register_node("cottages:reet", {
	description = S("Reed for thatching"),
	tiles = {"cottages_reet.png"},
	groups = {snappy = 3, choppy = 3, oddly_breakable_by_hand = 3, flammable = 3, roof = 1},
	sounds = default.node_sound_wood_defaults(),
	is_ground_content = false,
})

minetest.register_craft({
	output = "cottages:reet",
	recipe = {
			{ cottages.craftitem_papyrus, cottages.craftitem_papyrus },
			{ cottages.craftitem_papyrus, cottages.craftitem_papyrus },
	},
})

cottages.derive_blocks( "cottages", "reet", "Reed", "cottages_reet.png", {snappy = 3, choppy = 3, oddly_breakable_by_hand = 3, flammable = 3, roof = 1} )
