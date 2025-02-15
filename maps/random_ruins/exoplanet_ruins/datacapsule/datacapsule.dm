/datum/map_template/ruin/exoplanet/datacapsule
	name = "ejected data capsule"
	id = "datacapsule"
	description = "A damaged capsule with some strange contents."
	suffixes = list("datacapsule/datacapsule.dmm")
	cost = 1
	template_flags = TEMPLATE_FLAG_CLEAR_CONTENTS | TEMPLATE_FLAG_NO_RUINS
	ruin_tags = RUIN_HUMAN|RUIN_WRECK

	apc_test_exempt_areas = list(
		/area/map_template/datacapsule = NO_SCRUBBER|NO_VENT|NO_APC
	)

/area/map_template/datacapsule
	name = "\improper Ejected Data Capsule"
	icon_state = "blue"

/obj/abstract/landmark/corpse/zombiescience
	name = "Dead Scientist"
	corpse_outfits = list(/decl/hierarchy/outfit/zombie_science)

/decl/hierarchy/outfit/zombie_science
	name = "Job - Dead Scientist"
	uniform = /obj/item/clothing/under/color/white
	suit = /obj/item/clothing/suit/bio_suit/anomaly
	head = /obj/item/clothing/head/bio_hood/anomaly

/decl/material/liquid/zombie/science
	name = "isolated corruption"
	uid = "liquid_corruption_isolated"
	lore_text = "An incredibly dark, oily substance. Moves very slightly."
	taste_description = "decayed blood"
	color = "#800000"
	amount_to_zombify = 3

/obj/item/chems/glass/beaker/vial/random_podchem
	name = "unmarked vial"

/obj/item/chems/glass/beaker/vial/random_podchem/Initialize()
	. = ..()
	desc += "Label is smudged, and there's crusted blood fingerprints on it."
	var/reagent_type = pick(/decl/material/liquid/random, /decl/material/liquid/zombie/science, /decl/material/liquid/retrovirals)
	reagents.add_reagent(pick(reagent_type), 5)

/obj/structure/backup_server
	name = "backup server"
	icon = 'icons/obj/machines/server.dmi'
	icon_state = "server"
	desc = "Impact resistant server rack. You might be able to pry a disk out."
	var/disk_looted

/obj/structure/backup_server/attackby(obj/item/W, mob/user, var/click_params)
	if(IS_CROWBAR(W))
		if(disk_looted)
			to_chat(user, SPAN_WARNING("There's no disk in \the [src]."))
		else
			to_chat(user, SPAN_NOTICE("You pry out the data drive from \the [src]."))
			playsound(loc, 'sound/items/Crowbar.ogg', 50, 1)
			var/obj/item/stock_parts/computer/hard_drive/cluster/drive = new(get_turf(src))
			drive.origin_tech = "{'[TECH_DATA]':[rand(4,5)],'[TECH_ENGINEERING]':[rand(4,5)],'[TECH_EXOTIC_MATTER]':[rand(4,5)],'[TECH_COMBAT]':[rand(2,5)],'[TECH_ESOTERIC]':[rand(0,6)]}"
			disk_looted = TRUE
		return TRUE
	. = ..()
		
/obj/abstract/landmark/map_load_mark/ejected_datapod
	name = "random datapod contents"
	templates = list(/datum/map_template/ejected_datapod_contents, /datum/map_template/ejected_datapod_contents/type2, /datum/map_template/ejected_datapod_contents/type3)

/datum/map_template/ejected_datapod_contents
	name = "random datapod contents #1 (chem vials)"
	id = "datapod_1"
	mappaths = list("maps/random_ruins/exoplanet_ruins/datacapsule/contents_1.dmm")

/datum/map_template/ejected_datapod_contents/type2
	name = "random datapod contents #2 (servers)"
	id = "datapod_2"
	mappaths = list("maps/random_ruins/exoplanet_ruins/datacapsule/contents_2.dmm")

/datum/map_template/ejected_datapod_contents/type3
	name = "random datapod contents #2 (spiders)"
	id = "datapod_3"
	mappaths = list("maps/random_ruins/exoplanet_ruins/datacapsule/contents_3.dmm")