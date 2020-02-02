// This file is an experiment in changing the way item icons are handled.
// Not really expecting it to work out of the box, so we'll see how it goes
// with a handful of specific items.

/obj/item
	var/on_mob_icon

/obj/item/Initialize(ml, material_key)
	. = ..()
	if(on_mob_icon)
		icon = on_mob_icon
		icon_state = "world"

/obj/item/hud_layerise()
	..()
	if(on_mob_icon)
		icon_state = "inventory"

/obj/item/reset_plane_and_layer()
	..()
	if(on_mob_icon)
		if(plane == HUD_PLANE)
			icon_state = "inventory"
		else
			icon_state = "world"

/mob/proc/get_bodytype()
	return

/obj/item/proc/experimental_mob_overlay(var/mob/user_mob, var/slot)
	var/bodytype = lowertext(user_mob.get_bodytype()) || "human"
	var/image/I = image(get_icon_for_bodytype(bodytype), "[bodytype]-[slot]")
	I.color = color
	. = apply_offsets(user_mob, I, slot)
	. = apply_overlays(user_mob, bodytype, I, slot)

/mob/living/carbon/get_bodytype()
	. = species && species.get_bodytype(src)

/obj/item/proc/get_icon_for_bodytype(var/bodytype)
	. = icon

/obj/item/proc/apply_overlays(var/mob/user_mob, var/bodytype, var/image/overlay, var/slot)
	. = overlay

/obj/item/proc/apply_offsets(var/mob/user_mob, var/image/overlay, var/slot)
	. = overlay

// EXPERIMENTAL MAGIC HAT
//	/obj/item/testhat
//		name = "test hat"
//		slot_flags = SLOT_FEET | SLOT_HEAD | SLOT_GLOVES
//		on_mob_icon = 'icons/clothing/head/testhat.dmi'
