/obj/item/dildo
	name = "unfinished dildo"
	desc = "You have to finish it first."
	icon = 'modular/icons/obj/lewd/dildo.dmi'
	icon_state = "unfinished"
	item_state = "dildo"
	lefthand_file = 'modular/icons/mob/inhands/lewd/items_lefthand.dmi'
	righthand_file = 'modular/icons/mob/inhands/lewd/items_righthand.dmi'
	force = 1
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	obj_flags = CAN_BE_HIT
	sellprice = 1
	var/dildo_type = "human"
	var/dildo_size = "small"
	var/pleasure = 4
	var/can_custom = TRUE
	var/dildo_material

/obj/item/dildo/New()
	. = ..()
	name = "unfinished [dildo_material] dildo"

/obj/item/dildo/attack_self(mob/living/user)
	. = ..()
	if(!istype(user))
		return
	if(can_custom)
		customize(user)

/obj/item/dildo/equipped(mob/user, slot, initial = FALSE)
	if(slot == SLOT_BELT)
		var/mob/living/carbon/human/U = user
		if(strapon)
			var/obj/item/organ/penis/penis = U.getorganslot(ORGAN_SLOT_PENIS)
			if(!penis)
				penis = strapon
				wearer = U
				penis.Insert(U)
	. = ..()

/obj/item/dildo/proc/emptyStorage() //called when belt removed so we can use it to remove the strapon
	if(wearer) // so males who already have a penis dont get their dicks removed
		var/obj/item/organ/penis = wearer.getorganslot(ORGAN_SLOT_PENIS)
		if (penis)
			penis.Remove(wearer)

/obj/item/dildo/proc/customize(mob/living/user)
	if(!can_custom)
		return FALSE
	if(src && !user.incapacitated() && in_range(user,src))
		var/shape_choice = input(user, "Choose a shape for your dildo.","Dildo Shape") as null|anything in list("knotted", "human", "flared")
		if(src && shape_choice && !user.incapacitated() && in_range(user,src))
			dildo_type = shape_choice
	update_appearance()
	if(src && !user.incapacitated() && in_range(user,src))
		var/size_choice = input(user, "Choose a size for your dildo.","Dildo Size") as null|anything in list("small", "medium", "big")
		if(src && size_choice && !user.incapacitated() && in_range(user,src))
			dildo_size = size_choice
			switch(dildo_size)
				if("small")
					pleasure = 4
				if("medium")
					pleasure = 6
				if("big")
					pleasure = 8
	update_appearance()
	update_strapon()
	return TRUE

/obj/item/dildo/proc/update_strapon()
	var/obj/item/organ/penis/temp = new /obj/item/organ/penis
	temp.name = name
	icon_state = "dildo_[dildo_type]_[dildo_size]"
	switch(shape_choice)
		if("knotted")
			temp.penis_type = PENIS_TYPE_KNOTTED
		if("human")
			temp.penis_type = PENIS_TYPE_PLAIN
		if("flared")
			temp.penis_type = PENIS_TYPE_EQUINE
	switch(dildo_size)
		if("small")
			temp.organ_size = DEFAULT_PENIS_SIZE-1
		if("medium")
			temp.organ_size = DEFAULT_PENIS_SIZE
		if("big")
			temp.organ_size = DEFAULT_PENIS_SIZE+1
		if("huge")
			temp.organ_size = DEFAULT_PENIS_SIZE+1 //huge doesnt exist in mobs
	temp.always_hard = TRUE
	temp.strapon = TRUE
	strapon = temp

/obj/item/dildo/proc/update_appearance()
	icon_state = "dildo_[dildo_type]_[dildo_size]"
	name = "[dildo_size] [dildo_type] [dildo_material] dildo"
	desc = "To quench the woman's thirst."
	can_custom = FALSE

/obj/item/dildo/wood
	color = "#7D4033"
	resistance_flags = FLAMMABLE
	dildo_material = "wooden"
	sellprice = 1

/obj/item/dildo/iron
	color = "#9EA48E"
	dildo_material = "iron"
	sellprice = 5

/obj/item/dildo/steel
	color = "#9BADB7"
	dildo_material = "steel"
	sellprice = 10

/obj/item/dildo/silver
	color = "#C6D5E1"
	dildo_material = "silver"
	sellprice = 30

/obj/item/dildo/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampire/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampire/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampire) || H.mind.has_antag_datum(/datum/antagonist/vampire))
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(35)
		if(V_lord)
			if(V_lord.research_points < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampire))
				to_chat(H, span_userdanger("The silver sizzles in my hand..."))
				H.adjustFireLoss(15)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("The silver sizzles and burns my hand!"))
			H.adjustFireLoss(25)

/obj/item/dildo/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, span_notice("The silver needs more time to purify again."))
		return

	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		var/datum/antagonist/vampire/Vp = H.mind.has_antag_datum(/datum/antagonist/vampire)
		var/datum/antagonist/vampire/V = H.mind.has_antag_datum(/datum/antagonist/vampire)
		var/datum/antagonist/vampire/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampire/)
		if(Vp)
			H.Stun(20)
			to_chat(H, span_userdanger("The silver burns me!"))
			H.adjustFireLoss(30)
			H.Paralyze(20)
			H.fire_act(1,4)
			//H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
			src.last_used = world.time
		if(V)
			/*if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, span_userdanger("The silver burns me!"))
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				//H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else*/
			H.Stun(20)
			to_chat(H, span_userdanger("The silver burns me!"))
			H.adjustFireLoss(30)
			H.Paralyze(20)
			H.fire_act(1,4)
			//H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
			src.last_used = world.time
		if(V_lord)
			if(V_lord.research_points < 4 && !V)
				//if(V_lord.disguised)
				//	H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, span_userdanger("The silver burns me!"))
				H.Stun(10)
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.research_points == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, span_userdanger("This feeble metal can't hurt me, I AM THE ANCIENT!"))
		if(W && W.transformed == TRUE)
			H.Stun(40)
			H.Paralyze(40)
			to_chat(H, span_userdanger("The silver burns me!"))
			src.last_used = world.time

/obj/item/dildo/gold
	color = "#A0A075"
	dildo_material = "golden"
	sellprice = 50
