/obj/item/organ/external/chest/crystal
	name =                    "tendril junction"
	amputation_point =        "axis"
	joint =                   "central axis"
	cavity_name =             "core"
	w_class =                 ITEM_SIZE_LARGE
	body_part =               SLOT_LOWER_BODY
	organ_tag =               BP_CHEST
	parent_organ =            null
	max_damage =              50
	min_broken_damage =       25
	arterial_bleed_severity = 0
	encased = "ceramic hull"
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_BREAK | ORGAN_FLAG_HEALS_OVERKILL

/obj/item/organ/external/chest/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/groin/crystal
	name =                    "trailing tendrils"
	joint =                   "base"
	arterial_bleed_severity = 0
	max_damage =              50
	min_broken_damage =       25
	encased = "ceramic hull"
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_CAN_STAND | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/groin/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/head/crystal
	name =                    "chassis core"
	amputation_point =        "connector socket"
	joint =                   "connector socket"
	glowing_eyes =            TRUE
	arterial_bleed_severity = 0
	max_damage =              50
	min_broken_damage =       25
	cavity_max_w_class =      ITEM_SIZE_NORMAL // Apparently their brains change w_class to this.
	encased = "ceramic hull"
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_HEALS_OVERKILL | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/head/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/arm/crystal
	name =                    "left grasping tendril"
	amputation_point =        "midpoint"
	joint =                   "base"
	arterial_bleed_severity = 0
	max_damage =              20
	min_broken_damage =       10
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_CAN_STAND | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/arm/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/arm/right/crystal
	name =                    "right grasping tendril"
	amputation_point =        "midpoint"
	joint =                   "base"
	arterial_bleed_severity = 0
	max_damage =              20
	min_broken_damage =       10
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_CAN_STAND | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/arm/right/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/hand/crystal
	name =                    "left maniple tendril"
	amputation_point =        "midpoint"
	joint =                   "base"
	arterial_bleed_severity = 0
	max_damage =              20
	min_broken_damage =       10
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_CAN_STAND | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/hand/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/hand/right/crystal
	name =                    "right maniple tendril"
	amputation_point =        "midpoint"
	joint =                   "base"
	arterial_bleed_severity = 0
	max_damage =              20
	min_broken_damage =       10
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_CAN_STAND | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/hand/right/crystal/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/tendril
	name =                    "first tendril"
	amputation_point =        "midpoint"
	joint =                   "base"
	icon_name =               "l_leg"
	organ_tag =               BP_L_LEG
	parent_organ =            BP_CHEST
	arterial_bleed_severity = 0
	max_damage =              20
	min_broken_damage =       10
	icon = 'mods/species/bayliens/adherent/icons/body_turquoise.dmi'
	status = ORGAN_PROSTHETIC
	limb_flags = ORGAN_FLAG_CAN_AMPUTATE | ORGAN_FLAG_CAN_STAND | ORGAN_FLAG_CAN_BREAK

/obj/item/organ/external/tendril/update_limb_icon_file()
	icon = bodytype?.icon_base || initial(icon)

/obj/item/organ/external/tendril/two
	name =                    "second tendril"
	icon_name =               "r_leg"
	organ_tag =               BP_R_LEG

/obj/item/organ/external/tendril/three
	name =                    "third tendril"
	icon_name =               "l_foot"
	organ_tag =               BP_L_FOOT

/obj/item/organ/external/tendril/four
	name =                    "fourth tendril"
	icon_name =               "r_foot"
	organ_tag =               BP_R_FOOT
