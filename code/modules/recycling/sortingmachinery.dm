/obj/structure/bigDelivery
	desc = "A big wrapped package."
	name = "large parcel"
	icon = 'icons/obj/items/storage/deliverypackage.dmi'
	icon_state = "deliverycloset"
	var/obj/wrapped = null
	density = 1
	var/sortTag = null
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	var/examtext = null
	var/nameset = 0
	var/label_y
	var/label_x
	var/tag_x

/obj/structure/bigDelivery/attack_robot(mob/user)
	unwrap(user)

/obj/structure/bigDelivery/attack_hand(mob/user)
	unwrap(user)

/obj/structure/bigDelivery/proc/unwrap(var/mob/user)
	if(Adjacent(user))
		// Destroy will drop our wrapped object on the turf, so let it.
		qdel(src)

/obj/structure/bigDelivery/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/destTagger))
		var/obj/item/destTagger/O = W
		if(O.currTag)
			if(src.sortTag != O.currTag)
				to_chat(user, "<span class='notice'>You have labeled the destination as [O.currTag].</span>")
				if(!src.sortTag)
					src.sortTag = O.currTag
					update_icon()
				else
					src.sortTag = O.currTag
				playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
			else
				to_chat(user, "<span class='warning'>The package is already labeled for [O.currTag].</span>")
		else
			to_chat(user, "<span class='warning'>You need to set a destination first!</span>")

	else if(istype(W, /obj/item/pen))
		switch(alert("What would you like to alter?",,"Title","Description", "Cancel"))
			if("Title")
				var/str = sanitize_safe(input(usr,"Label text?","Set label",""), MAX_NAME_LEN)
				if(!str || !length(str))
					to_chat(usr, "<span class='warning'> Invalid text.</span>")
					return
				user.visible_message("\The [user] titles \the [src] with \a [W], marking down: \"[str]\"",\
				"<span class='notice'>You title \the [src]: \"[str]\"</span>",\
				"You hear someone scribbling a note.")
				SetName("[name] ([str])")
				if(!examtext && !nameset)
					nameset = 1
					update_icon()
				else
					nameset = 1
			if("Description")
				var/str = sanitize(input(usr,"Label text?","Set label",""))
				if(!str || !length(str))
					to_chat(usr, "<span class='warning'>Invalid text.</span>")
					return
				if(!examtext && !nameset)
					examtext = str
					update_icon()
				else
					examtext = str
				user.visible_message("\The [user] labels \the [src] with \a [W], scribbling down: \"[examtext]\"",\
				"<span class='notice'>You label \the [src]: \"[examtext]\"</span>",\
				"You hear someone scribbling a note.")
	return

/obj/structure/bigDelivery/on_update_icon()
	..()
	if(nameset || examtext)
		var/image/I = new/image(icon,"delivery_label")
		if(icon_state == "deliverycloset")
			I.pixel_x = 2
			if(label_y == null)
				label_y = rand(-6, 11)
			I.pixel_y = label_y
		else if(icon_state == "deliverycrate")
			if(label_x == null)
				label_x = rand(-8, 6)
			I.pixel_x = label_x
			I.pixel_y = -3
		add_overlay(I)
	if(src.sortTag)
		var/image/I = new/image(icon,"delivery_tag")
		if(icon_state == "deliverycloset")
			if(tag_x == null)
				tag_x = rand(-2, 3)
			I.pixel_x = tag_x
			I.pixel_y = 9
		else if(icon_state == "deliverycrate")
			if(tag_x == null)
				tag_x = rand(-8, 6)
			I.pixel_x = tag_x
			I.pixel_y = -3
		add_overlay(I)

/obj/structure/bigDelivery/examine(mob/user, distance)
	. = ..()
	if(distance <= 4)
		if(sortTag)
			to_chat(user, "<span class='notice'>It is labeled \"[sortTag]\"</span>")
		if(examtext)
			to_chat(user, "<span class='notice'>It has a note attached which reads, \"[examtext]\"</span>")

/obj/structure/bigDelivery/Destroy()
	if(wrapped) //sometimes items can disappear. For example, bombs. --rastaf0
		wrapped.dropInto(loc)
		if(istype(wrapped, /obj/structure/closet))
			var/obj/structure/closet/O = wrapped
			O.welded = 0
		wrapped = null
	var/turf/T = get_turf(src)
	for(var/atom/movable/AM in contents)
		AM.forceMove(T)
	return ..()

/obj/item/smallDelivery
	desc = "A small wrapped package."
	name = "small parcel"
	icon = 'icons/obj/items/storage/deliverypackage.dmi'
	icon_state = "deliverycrate3"
	var/obj/item/wrapped = null
	var/sortTag = null
	var/examtext = null
	var/nameset = 0
	var/tag_x

/obj/item/smallDelivery/proc/unwrap(var/mob/user)
	if (!contents.len || !Adjacent(user))
		return

	user.put_in_hands(wrapped)
	// Take out any other items that might be in the package
	for(var/obj/item/I in src)
		user.put_in_hands(I)

	qdel(src)

/obj/item/smallDelivery/attack_robot(mob/user)
	unwrap(user)

/obj/item/smallDelivery/attack_self(mob/user)
	unwrap(user)

/obj/item/smallDelivery/attackby(obj/item/W, mob/user)
	if(istype(W, /obj/item/destTagger))
		var/obj/item/destTagger/O = W
		if(O.currTag)
			if(src.sortTag != O.currTag)
				to_chat(user, "<span class='notice'>You have labeled the destination as [O.currTag].</span>")
				if(!src.sortTag)
					src.sortTag = O.currTag
					update_icon()
				else
					src.sortTag = O.currTag
				playsound(src.loc, 'sound/machines/twobeep.ogg', 50, 1)
			else
				to_chat(user, "<span class='warning'>The package is already labeled for [O.currTag].</span>")
		else
			to_chat(user, "<span class='warning'>You need to set a destination first!</span>")

	else if(istype(W, /obj/item/pen))
		switch(alert("What would you like to alter?",,"Title","Description", "Cancel"))
			if("Title")
				var/str = sanitize_safe(input(usr,"Label text?","Set label",""), MAX_NAME_LEN)
				if(!str || !length(str))
					to_chat(usr, "<span class='warning'> Invalid text.</span>")
					return
				user.visible_message("\The [user] titles \the [src] with \a [W], marking down: \"[str]\"",\
				"<span class='notice'>You title \the [src]: \"[str]\"</span>",\
				"You hear someone scribbling a note.")
				SetName("[name] ([str])")
				if(!examtext && !nameset)
					nameset = 1
					update_icon()
				else
					nameset = 1

			if("Description")
				var/str = sanitize(input(usr,"Label text?","Set label",""))
				if(!str || !length(str))
					to_chat(usr, "<span class='warning'>Invalid text.</span>")
					return
				if(!examtext && !nameset)
					examtext = str
					update_icon()
				else
					examtext = str
				user.visible_message("\The [user] labels \the [src] with \a [W], scribbling down: \"[examtext]\"",\
				"<span class='notice'>You label \the [src]: \"[examtext]\"</span>",\
				"You hear someone scribbling a note.")
	return

/obj/item/smallDelivery/on_update_icon()
	overlays.Cut()
	if((nameset || examtext) && icon_state != "deliverycrate1")
		var/image/I = new/image(icon,"delivery_label")
		if(icon_state == "deliverycrate5")
			I.pixel_y = -1
		overlays += I
	if(src.sortTag)
		var/image/I = new/image(icon,"delivery_tag")
		switch(icon_state)
			if("deliverycrate1")
				I.pixel_y = -5
			if("deliverycrate2")
				I.pixel_y = -2
			if("deliverycrate3")
				I.pixel_y = 0
			if("deliverycrate4")
				if(tag_x == null)
					tag_x = rand(0,5)
				I.pixel_x = tag_x
				I.pixel_y = 3
			if("deliverycrate5")
				I.pixel_y = -3
		overlays += I

/obj/item/smallDelivery/examine(mob/user, distance)
	. = ..()
	if(distance <= 4)
		if(sortTag)
			to_chat(user, "<span class='notice'>It is labeled \"[sortTag]\"</span>")
		if(examtext)
			to_chat(user, "<span class='notice'>It has a note attached which reads, \"[examtext]\"</span>")

/obj/item/stack/package_wrap
	name = "package wrapper"
	desc = "Heavy duty brown paper used to wrap packages to protect them during shipping."
	singular_name = "sheet"
	max_amount = 25
	icon = 'icons/obj/items/gift_wrapper.dmi'
	icon_state = "deliveryPaper"
	w_class = ITEM_SIZE_NORMAL

/obj/item/stack/package_wrap/twenty_five
	amount = 25


/obj/item/c_tube
	name = "cardboard tube"
	desc = "A tube... of cardboard."
	icon = 'icons/obj/items/gift_wrapper.dmi'
	icon_state = "c_tube"
	throwforce = 1
	w_class = ITEM_SIZE_SMALL
	throw_speed = 4
	throw_range = 5

/obj/item/stack/package_wrap/afterattack(var/obj/target, mob/user, proximity)
	if(!proximity) return
	if(!istype(target))	//this really shouldn't be necessary (but it is).	-Pete
		return
	if(istype(target, /obj/item/smallDelivery) || istype(target,/obj/structure/bigDelivery) \
	|| istype(target, /obj/item/gift) || istype(target, /obj/item/evidencebag))
		return
	if(target.anchored)
		return
	if(target in user)
		return
	if(user in target) //no wrapping closets that you are inside - it's not physically possible
		return

	if (istype(target, /obj/item) && !(istype(target, /obj/item/storage) && !istype(target,/obj/item/storage/box)))
		var/obj/item/O = target
		if (src.get_amount() >= 1)
			var/obj/item/smallDelivery/P = new /obj/item/smallDelivery(get_turf(O.loc))	//Aaannd wrap it up!
			if(!isturf(O.loc))
				if(user.client)
					user.client.screen -= O
			P.wrapped = O
			O.forceMove(P)
			P.w_class = O.w_class
			var/i = round(O.w_class)
			if(i in list(1,2,3,4,5))
				P.icon_state = "deliverycrate[i]"
				switch(i)
					if(1) P.SetName("tiny parcel")
					if(3) P.SetName("normal-sized parcel")
					if(4) P.SetName("large parcel")
					if(5) P.SetName("huge parcel")
			if(i < 1)
				P.icon_state = "deliverycrate1"
				P.SetName("tiny parcel")
			if(i > 5)
				P.icon_state = "deliverycrate5"
				P.SetName("huge parcel")
			P.add_fingerprint(usr)
			O.add_fingerprint(usr)
			src.add_fingerprint(usr)
			src.use(1)
			user.visible_message("\The [user] wraps \a [target] with \a [src].",\
			"<span class='notice'>You wrap \the [target], leaving [src.get_amount()] units of paper on \the [src].</span>",\
			"You hear someone taping paper around a small object.")
		else
			// Should be possible only to see this as a borg?
			to_chat(user, "<span class='warning'>The synthesizer is out of paper.</span>")
	else if (istype(target, /obj/structure/closet/crate))
		var/obj/structure/closet/crate/O = target
		if (src.get_amount() >= 3 && !O.opened)
			var/obj/structure/bigDelivery/P = new /obj/structure/bigDelivery(get_turf(O.loc))
			P.icon_state = "deliverycrate"
			P.wrapped = O
			O.forceMove(P)
			src.use(3)
			user.visible_message("\The [user] wraps \a [target] with \a [src].",\
			"<span class='notice'>You wrap \the [target], leaving [src.get_amount()] units of paper on \the [src].</span>",\
			"You hear someone taping paper around a large object.")
		else if(src.get_amount() < 3)
			to_chat(user, "<span class='warning'>You need more paper.</span>")
	else if (istype (target, /obj/structure/closet))
		var/obj/structure/closet/O = target
		if (src.get_amount() >= 3 && !O.opened)
			var/obj/structure/bigDelivery/P = new /obj/structure/bigDelivery(get_turf(O.loc))
			P.wrapped = O
			O.welded = 1
			O.forceMove(P)
			src.use(3)
			user.visible_message("\The [user] wraps \a [target] with \a [src].",\
			"<span class='notice'>You wrap \the [target], leaving [src.get_amount()] units of paper on \the [src].</span>",\
			"You hear someone taping paper around a large object.")
		else if(src.get_amount() < 3)
			to_chat(user, "<span class='warning'>You need more paper.</span>")
	else
		to_chat(user, "<span class='notice'>The object you are trying to wrap is unsuitable for the sorting machinery!</span>")

	return

/obj/item/destTagger
	name = "destination tagger"
	desc = "Used to set the destination of properly wrapped packages."
	icon = 'icons/obj/items/device/destination_tagger.dmi'
	icon_state = ICON_STATE_WORLD
	w_class = ITEM_SIZE_SMALL
	obj_flags = OBJ_FLAG_CONDUCTIBLE
	slot_flags = SLOT_LOWER_BODY
	material = /decl/material/solid/metal/steel
	matter = list(/decl/material/solid/fiberglass = MATTER_AMOUNT_REINFORCEMENT)
	var/currTag = 0

/obj/item/destTagger/proc/openwindow(mob/user)
	var/dat = "<tt><center><h1><b>TagMaster 2.3</b></h1></center>"

	dat += "<table style='width:100%; padding:4px;'><tr>"
	for(var/i = 1, i <= global.tagger_locations.len, i++)
		dat += "<td><a href='?src=\ref[src];nextTag=[global.tagger_locations[i]]'>[global.tagger_locations[i]]</a></td>"

		if (i%4==0)
			dat += "</tr><tr>"

	dat += "</tr></table><br>Current Selection: [currTag ? currTag : "None"]</tt>"
	dat += "<br><a href='?src=\ref[src];nextTag=CUSTOM'>Enter custom location.</a>"
	show_browser(user, dat, "window=destTagScreen;size=450x375")
	onclose(user, "destTagScreen")

/obj/item/destTagger/attack_self(mob/user)
	openwindow(user)

/obj/item/destTagger/OnTopic(user, href_list, state)
	if(href_list["nextTag"] && (href_list["nextTag"] in global.tagger_locations))
		src.currTag = href_list["nextTag"]
		to_chat(user, "<span class='notice'>You set [src] to <b>[src.currTag]</b>.</span>")
		playsound(src.loc, 'sound/machines/chime.ogg', 50, 1)
		. = TOPIC_REFRESH
	if(href_list["nextTag"] == "CUSTOM")
		var/dest = input(user, "Please enter custom location.", "Location", src.currTag ? src.currTag : "None")
		if(CanUseTopic(user, state))
			if(dest && lowertext(dest) != "none")
				src.currTag = dest
				to_chat(user, "<span class='notice'>You designate a custom location on [src], set to <b>[src.currTag]</b>.</span>")
				playsound(src.loc, 'sound/machines/chime.ogg', 50, 1)
			else
				src.currTag = 0
				to_chat(user, "<span class='notice'>You clear [src]'s custom location.</span>")
				playsound(src.loc, 'sound/machines/chime.ogg', 50, 1)
			. = TOPIC_REFRESH
		else
			. = TOPIC_HANDLED

	if(. == TOPIC_REFRESH)
		openwindow(user)

/obj/machinery/disposal/deliveryChute
	name = "delivery chute"
	desc = "A chute for big and small packages alike!"
	density = 1
	icon_state = "intake"
	base_type = /obj/machinery/disposal/deliveryChute/buildable
	frame_type = /obj/structure/disposalconstruct/machine/chute

	var/c_mode = 0

/obj/machinery/disposal/deliveryChute/buildable
	uncreated_component_parts = null

/obj/machinery/disposal/deliveryChute/Initialize()
	. = ..()
	trunk = locate() in src.loc
	if(trunk)
		trunk.linked = src	// link the pipe trunk to self

/obj/machinery/disposal/deliveryChute/interact()
	return

/obj/machinery/disposal/deliveryChute/on_update_icon()
	return

/obj/machinery/disposal/deliveryChute/CanPass(atom/movable/mover, turf/target, height=1.5, air_group = 0)
	. = (get_dir(src, mover) != dir) && ..()

/obj/machinery/disposal/deliveryChute/Bumped(var/atom/movable/AM) //Go straight into the chute

	if(istype(AM, /obj/item/projectile) || istype(AM, /obj/effect))	
		return

	if(get_dir(src, AM) != dir)
		return

	var/mob/living/L = AM
	if (istype(L) && L.ckey)
		log_and_message_admins("has flushed themselves down \the [src].", L)
	if(istype(AM, /obj))
		var/obj/O = AM
		O.forceMove(src)
	else if(istype(AM, /mob))
		var/mob/M = AM
		M.forceMove(src)
	src.flush()

/obj/machinery/disposal/deliveryChute/flush()
	flushing = 1
	flick("intake-closing", src)
	var/obj/structure/disposalholder/H = new()	// virtual holder object which actually
												// travels through the pipes.
	air_contents = new()		// new empty gas resv.

	sleep(10)
	playsound(src, 'sound/machines/disposalflush.ogg', 50, 0, 0)
	sleep(5) // wait for animation to finish

	if(prob(35))
		for(var/mob/living/carbon/human/L in src)
			var/list/obj/item/organ/external/crush = L.get_damageable_organs()
			if(!crush.len)
				return

			var/obj/item/organ/external/E = pick(crush)

			E.take_external_damage(45, used_weapon = "Blunt Trauma")
			to_chat(L, "\The [src]'s mechanisms crush your [E.name]!")

	H.init(src)	// copy the contents of disposer to holder

	H.start(src) // start the holder processing movement
	flushing = 0
	// now reset disposal state
	flush = 0
	if(mode == 2)	// if was ready,
		mode = 1	// switch to charging
	update_icon()
	return

/obj/machinery/disposal/deliveryChute/attackby(var/obj/item/I, var/mob/user)
	if(!I || !user)
		return

	if(IS_SCREWDRIVER(I))
		if(c_mode==0)
			c_mode=1
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			to_chat(user, "You remove the screws around the power connection.")
			return
		else if(c_mode==1)
			c_mode=0
			playsound(src.loc, 'sound/items/Screwdriver.ogg', 50, 1)
			to_chat(user, "You attach the screws around the power connection.")
			return
	else if(IS_WELDER(I) && c_mode==1)
		var/obj/item/weldingtool/W = I
		if(W.remove_fuel(1,user))
			to_chat(user, "You start slicing the floorweld off the delivery chute.")
			if(do_after(user,20, src))
				playsound(src.loc, 'sound/items/Welder2.ogg', 100, 1)
				if(!src || !W.isOn()) return
				to_chat(user, "You sliced the floorweld off the delivery chute.")
				var/obj/structure/disposalconstruct/C = new (loc, src)
				C.update()
				qdel(src)
			return
		else
			to_chat(user, "You need more welding fuel to complete this task.")
			return

/obj/machinery/disposal/deliveryChute/Destroy()
	if(trunk)
		trunk.linked = null
	return ..()

/obj/item/stack/package_wrap/cyborg
	name = "package wrapper synthesizer"
	icon = 'icons/obj/items/gift_wrapper.dmi'
	icon_state = "deliveryPaper"
	gender = NEUTER
	matter = null
	uses_charge = 1
	charge_costs = list(1)
	stack_merge_type = /obj/item/stack/package_wrap