-- travelnet_redo_fancy/init.lua
-- Travelnets with fancy textures for Travelnet Redo
-- Copyright (C) 2015-2024  mt-mods members and contributors
-- Copyright (C) 2024  1F616EMO
-- SPDX-License-Identifier: GPL-3.0-or-later

if not travelnet_redo.register_boxlike_travelnet then
    error("[travelnet_redo_fancy] Please upgrade your Travelnet Redo.")
end

local S = minetest.get_translator("travelnet_redo_fancy")

travelnet_redo.register_boxlike_travelnet("travelnet_redo_fancy:fancy_travelnet", {
    description = S("Fancy Travelnet"),
    tiles = {
        "travelnet_redo_fancy_front.png",
        "travelnet_redo_fancy_back.png",
        "travelnet_redo_fancy_side.png",
        "travelnet_top.png",
        "travelnet_bottom.png",
    },
    inventory_image = "travelnet_redo_fancy_inv.png",
    light_source = 10,
    groups = { cracky = 3, pickaxey = 1, transport = 1 },
    sounds = xcompat.sounds.node_sound_glass_defaults(),
})

travelnet_redo.register_boxlike_travelnet("travelnet_redo_fancy:undercore", {
    description = S("Magical Travelnet"),
    tiles = {
        {
            image = "travelnet_redo_fancy_undercore_front.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 32,
                length = 1.5
            },
        },
        "travelnet_redo_fancy_undercore_back.png",
        "travelnet_redo_fancy_undercore_side.png",
        "[combine:16x16:0,-16=travelnet_redo_fancy_undercore_side.png",
        {
            image = "travelnet_redo_fancy_undercore_bottom.png",
            backface_culling = false,
            animation = {
                type = "vertical_frames",
                aspect_w = 16,
                aspect_h = 16,
                length = 1
            },
        },
    },
    inventory_image = "travelnet_redo_fancy_undercore_inv.png",
    light_source = 10,
    groups = { cracky = 2, pickaxey = 1, transport = 1 },
    sounds = xcompat.sounds.node_sound_stone_defaults(),
})

minetest.register_craft({
    type = "shapeless",
    output = "travelnet_redo_fancy:fancy_travelnet",
    recipe = { "group:travelnet_redo_default", xcompat.materials.gold_ingot }
})

if minetest.get_modpath("moreores") then
    minetest.register_craft({
        type = "shapeless",
        output = "travelnet_redo_fancy:undercore",
        recipe = { "group:travelnet_redo_default", "moreores:mithril_ingot" }
    })
end
