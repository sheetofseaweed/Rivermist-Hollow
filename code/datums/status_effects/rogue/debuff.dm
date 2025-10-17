/datum/status_effect/debuff
	status_type = STATUS_EFFECT_REFRESH

///////////////////////////

/datum/status_effect/debuff/hungryt1
	id = "hungryt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list(STATKEY_CON = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt1
	name = "Hungry"
	desc = "Hunger weakens this living body."
	icon_state = "hunger1"

/datum/status_effect/debuff/hungryt2
	id = "hungryt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt2
	effectedstats = list(STATKEY_STR = -2, STATKEY_CON = -2, STATKEY_WIL = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt2
	name = "Hungry"
	desc = "This living body suffers heavily from hunger."
	icon_state = "hunger2"

/datum/status_effect/debuff/hungryt3
	id = "hungryt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt3
	effectedstats = list(STATKEY_STR = -5, STATKEY_CON = -3, STATKEY_WIL = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt3
	name = "Hungry"
	desc = "My body can barely hold it!"
	icon_state = "hunger3"

/datum/status_effect/debuff/thirstyt1
	id = "thirsty1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt1
	effectedstats = list(STATKEY_WIL = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt1
	name = "Thirsty"
	desc = "I need water."
	icon_state = "thirst1"

/datum/status_effect/debuff/thirstyt2
	id = "thirsty2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt2
	effectedstats = list(STATKEY_SPD = -1, STATKEY_WIL = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt2
	name = "Thirsty"
	desc = "My mouth feels much drier."
	icon_state = "thirst2"

/datum/status_effect/debuff/thirstyt3
	id = "thirsty3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt3
	effectedstats = list(STATKEY_STR = -1, STATKEY_SPD = -2, STATKEY_WIL = -3)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt3
	name = "Thirsty"
	desc = "I urgently need water!"
	icon_state = "thirst3"

/////////

/datum/status_effect/debuff/uncookedfood
	id = "uncookedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/uncookedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ORGAN_EATER) || HAS_TRAIT(owner, TRAIT_WILD_EATER))
		return ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/badmeal
	id = "badmeal"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/badmeal/on_apply()
	owner.add_stress(/datum/stressevent/badmeal)
	return ..()

/datum/status_effect/debuff/burnedfood
	id = "burnedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/burnedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/burntmeal)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/rotfood
	id = "rotfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/rotfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ROT_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/rotfood)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(200)
	return ..()

/datum/status_effect/debuff/bleeding
	id = "bleedingt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt1
	effectedstats = list(STATKEY_SPD = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt1
	name = "Dizzy"
	desc = ""
	icon_state = "bleed1"

/datum/status_effect/debuff/bleedingworse
	id = "bleedingt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt2
	effectedstats = list(STATKEY_STR = -1, STATKEY_SPD = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt2
	name = "Faint"
	desc = ""
	icon_state = "bleed2"

/datum/status_effect/debuff/bleedingworst
	id = "bleedingt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt3
	effectedstats = list(STATKEY_STR = -3, STATKEY_SPD = -4)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt3
	name = "Drained"
	desc = ""
	icon_state = "bleed3"

/datum/status_effect/debuff/sleepytime
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/sleepytime

/atom/movable/screen/alert/status_effect/debuff/netted
	name = "Net"
	desc = "A net was thrown on me.. how can I move?"
	icon_state = "muscles"

/datum/status_effect/debuff/netted
	id = "net"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/netted
	effectedstats = list(STATKEY_SPD = -5, STATKEY_WIL = -2)
	duration = 3 MINUTES

/datum/status_effect/debuff/netted/on_apply()
		. = ..()
		var/mob/living/carbon/C = owner
		C.add_movespeed_modifier(MOVESPEED_ID_NET_SLOWDOWN, multiplicative_slowdown = 3)

/datum/status_effect/debuff/netted/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.legcuffed = null
		C.update_inv_legcuffed()
		C.remove_movespeed_modifier(MOVESPEED_ID_NET_SLOWDOWN)

/atom/movable/screen/alert/status_effect/debuff/sleepytime
	name = "Tired"
	desc = "I should get some rest."
	icon_state = "sleepy"

/datum/status_effect/debuff/muscle_sore
	id = "muscle_sore"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/muscle_sore
	effectedstats = list(STATKEY_STR = -1, STATKEY_WIL = -1)

/atom/movable/screen/alert/status_effect/debuff/muscle_sore
	name = "Muscle Soreness"
	desc = "My muscles need some sleep to recover."
	icon_state = "muscles"

/datum/status_effect/debuff/devitalised
	id = "devitalised"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/devitalised
	effectedstats = list(STATKEY_STR = -1, STATKEY_WIL = -1, STATKEY_CON = -1, STATKEY_SPD = -1, STATKEY_LCK = -1)	//Slightly punishing.
	duration = 15 MINUTES	//Punishing, same time as revival, but mildly less punishing than revival itself.

/atom/movable/screen/alert/status_effect/debuff/devitalised
	name = "Devitalised"
	desc = "Something has been taken from me, and it will take time to recover."

/datum/status_effect/debuff/vamp_dreams
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/vamp_dreams

/atom/movable/screen/alert/status_effect/debuff/vamp_dreams
	name = "Insight"
	desc = "With some sleep in a coffin I feel like I could become better."
	icon_state = "sleepy"

/datum/status_effect/debuff/ritualdefiled
	id = "ritualdefiled"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ritualdefiled
	effectedstats = list(STATKEY_STR = -1, STATKEY_WIL = -1, STATKEY_CON = -1, STATKEY_SPD = -1, STATKEY_LCK = -1)
	duration = 1 HOURS // Punishing AS FUCK, but not as punishing as being dead.


/atom/movable/screen/alert/status_effect/debuff/ritualdefiled
	name = "Tainted Lux"
	desc = "My Lux has been tainted in a vile heretic ritual."

/// SURRENDERING DEBUFFS

/datum/status_effect/debuff/breedable
	id = "breedable"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/breedable
	duration = 30 SECONDS

/datum/status_effect/debuff/breedable/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/datum/status_effect/debuff/breedable/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)

/atom/movable/screen/alert/status_effect/debuff/breedable
	name = "Obedient"
	desc = "They won't hurt me too much..."

/datum/status_effect/debuff/submissive
	id = "submissive"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/submissive
	duration = 60 SECONDS

/datum/status_effect/debuff/submissive/on_apply()
	. = ..()
	owner.add_movespeed_modifier("SUBMISSIVE", multiplicative_slowdown = 4)

/datum/status_effect/debuff/submissive/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("SUBMISSIVE")

/atom/movable/screen/alert/status_effect/debuff/submissive
	name = "Conformable"
	desc = "Falling in line is my only choice."

/datum/status_effect/debuff/chilled
	id = "chilled"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/chilled
	effectedstats = list(STATKEY_SPD = -5, STATKEY_STR = -2, STATKEY_WIL = -2)
	duration = 15 SECONDS

/atom/movable/screen/alert/status_effect/debuff/chilled
	name = "Chilled"
	desc = "I can barely feel my limbs!"
	icon_state = "chilled"


/datum/status_effect/debuff/ritesexpended
	id = "ritesexpended"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ritesexpended
	duration = 30 MINUTES

/atom/movable/screen/alert/status_effect/debuff/ritesexpended
	name = "Rites Complete"
	desc = "It will take time before I can next perform a rite."
	icon_state = "ritesexpended"

/datum/status_effect/debuff/ritesexpended_heavy
	id = "ritesexpended_heavy"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ritesexpended_heavy
	duration = 1 HOURS

/atom/movable/screen/alert/status_effect/debuff/ritesexpended_heavy
	name = "Rites Complete"
	desc = "It will take a lot of time before I can perform a next rite. I am drained."
	icon_state = "ritesexpended"

/datum/status_effect/debuff/call_to_arms
	id = "call_to_arms"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/call_to_arms
	effectedstats = list(STATKEY_WIL = -2, STATKEY_CON = -2)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/call_to_arms
	name = "Ravox's Call to Arms"
	desc = "His voice keeps ringing in your ears, rocking your soul.."
	icon_state = "call_to_arms"

/datum/status_effect/debuff/ravox_burden
	id = "ravox_burden"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ravox_burden
	effectedstats = list(STATKEY_SPD = -2, STATKEY_WIL = -3)
	duration = 12 SECONDS

/atom/movable/screen/alert/status_effect/debuff/ravox_burden
	name = "Ravox's Burden"
	desc = "My arms and legs are restrained by divine chains!\n"
	icon_state = "restrained"

/datum/status_effect/debuff/call_to_slaughter
	id = "call_to_slaughter"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/call_to_slaughter
	effectedstats = list(STATKEY_WIL = -2, STATKEY_CON = -2)
	duration = 2.5 MINUTES

/atom/movable/screen/alert/status_effect/debuff/call_to_slaughter
	name = "Call to Slaughter"
	desc = "A putrid rotting scent fills your nose as Graggar's call for slaughter rattles you to your core.."
	icon_state = "call_to_slaughter"

//For revive - your body DIDN'T rot, but it did suffer damage. Unlike being rotted, this one is only timed. Not forever.
/datum/status_effect/debuff/revived
	id = "revived"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/revived
	effectedstats = list(STATKEY_STR = -1, STATKEY_PER = -1, STATKEY_INT = -1, STATKEY_WIL = -1, STATKEY_CON = -1, STATKEY_SPD = -1, STATKEY_LCK = -1)
	duration = 15 MINUTES		//Should be long enough to stop someone from running back into battle. Plus, this stacks with body-rot debuff. RIP.

/atom/movable/screen/alert/status_effect/debuff/revived
	name = "Revival Sickness"
	desc = "You felt lyfe itself course through you, restoring your lux and your essance. You.. live - but your body aches. It still needs time to recover.."
	icon_state = "revived"

//For de-rot - your body ROTTED. Harsher penalty for longer, can be fully off-set with a cure-rot potion.
/datum/status_effect/debuff/rotted
	id = "rotted_body"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/rotted
	effectedstats = list(STATKEY_STR = -2, STATKEY_PER = -2, STATKEY_INT = -2, STATKEY_WIL = -2, STATKEY_CON = -2, STATKEY_SPD = -2, STATKEY_LCK = -2)
	duration = 30 MINUTES	//Back to a temporary 30 min duration. It hurts.

/atom/movable/screen/alert/status_effect/debuff/rotted
	name = "Body Rot Paralysis"
	desc = "You came back from death, but everything aches.. you can feel it in your muscles. Even in your nose, you can smell something putrid and foul. You live yet, but at what cost..?"
	icon_state = "rotted_body"

//Replaces the flat-stat change, this should ONLY apply to zombies who have been dead for some time. Makes them easier to kill.
/datum/status_effect/debuff/rotted_zombie
	id = "rotted_zombie"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/rotted_zombie
	effectedstats = list(STATKEY_CON = -8)
	//No duration = infinate in time - this is removed on de-rot miricle OR de-rot surgery. Won't be applied unless you've been a zombie for ~20 min.

/atom/movable/screen/alert/status_effect/debuff/rotted_zombie
	name = "Decomposing Corpse"
	desc = "You've been dead for some time.. your body is finally starting to give out on you."
	icon_state = "rotted_body"	//Temp holdover, no idea what I'd do for a new icon for this.

/datum/status_effect/debuff/dazed
	id = "dazed"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/dazed
	effectedstats = list(STATKEY_PER = -2, STATKEY_INT = -2)
	duration = 15 SECONDS
	status_type = STATUS_EFFECT_REFRESH

/datum/status_effect/debuff/dazed/shield
	effectedstats = list(STATKEY_PER = -3, STATKEY_LCK = -1)
	duration = 8 SECONDS

/atom/movable/screen/alert/status_effect/debuff/dazed
	name = "Dazed"
	desc = "You've been smacked on the head very hard. Which way is left, again?"
	icon_state = "dazed"

/datum/status_effect/debuff/cold
	id = "Frostveiled"
	alert_type =  /atom/movable/screen/alert/status_effect/debuff/cold
	effectedstats = list(STATKEY_SPD = -2)
	duration = 12 SECONDS

/datum/status_effect/debuff/cold/on_apply()
	. = ..()
	var/mob/living/target = owner
	var/newcolor = rgb(136, 191, 255)
	target.add_atom_colour(newcolor, TEMPORARY_COLOUR_PRIORITY)
	addtimer(CALLBACK(target, TYPE_PROC_REF(/atom, remove_atom_colour), TEMPORARY_COLOUR_PRIORITY, newcolor), 12 SECONDS)

/atom/movable/screen/alert/status_effect/debuff/cold
	name = "Cold"
	desc = "Something has chilled me to the bone! It's hard to move."
	icon_state = "muscles"

/*/atom/movable/screen/alert/status_effect/debuff/dazed/shield
	name = "Dazed by fencer's wrap"
	desc = "That stupid piece of cloth is so distracting! It pisses me off!"
	icon_state = "dazed" */

/datum/status_effect/debuff/staggered
	id = "staggered"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/staggered
	effectedstats = list(STATKEY_PER = -2, STATKEY_SPD = -2, STATKEY_CON = -2)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/debuff/staggered
	name = "Staggered"
	desc = "You've been smacked by something big. The force of impact has left you staggered."
	icon_state = "dazed"

/datum/status_effect/debuff/staggered/on_apply()
		. = ..()
		var/mob/living/carbon/C = owner
		C.add_movespeed_modifier(MOVESPEED_ID_DAMAGE_SLOWDOWN, multiplicative_slowdown = 1.5)

/datum/status_effect/debuff/staggered/on_remove()
	. = ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.remove_movespeed_modifier(MOVESPEED_ID_DAMAGE_SLOWDOWN)

/datum/status_effect/debuff/excomm
	id = "Excommunicated!"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/excomm
	effectedstats = list(STATKEY_LCK = -2, STATKEY_INT = -2, STATKEY_SPD = -1, STATKEY_WIL = -1, STATKEY_CON = -1)
	duration = -1

/atom/movable/screen/alert/status_effect/debuff/excomm
	name = "Excommunicated!"
	desc = "The Ten have forsaken me!"
	icon_state = "muscles"
	color ="#6d1313"

/datum/status_effect/debuff/apostasy
	id = "Apostasy!"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/apostasy
	effectedstats = list(STATKEY_LCK = -5, STATKEY_INT = -3, STATKEY_PER = -2 , STATKEY_SPD = -2, STATKEY_WIL = -2, STATKEY_CON = -2)
	duration = -1
	var/resistant = FALSE
	var/original_devotion = 0
	var/original_prayer_effectiveness = 0
	var/original_passive_devotion_gain = 0
	var/original_passive_progression_gain = 0

/datum/status_effect/debuff/apostasy/on_creation(mob/living/new_owner, resistant = FALSE)
	src.resistant = resistant
	return ..()

/datum/status_effect/debuff/apostasy/on_apply()
	. = ..()
	if(!ishuman(owner))
		return FALSE
	var/mob/living/carbon/human/H = owner
	if(!H.devotion)
		return FALSE

	var/datum/devotion/D = H.devotion
	original_devotion = D.devotion
	original_prayer_effectiveness = D.prayer_effectiveness
	original_passive_devotion_gain = D.passive_devotion_gain
	original_passive_progression_gain = D.passive_progression_gain

	if(resistant)
		D.devotion = original_devotion * 0.5
		D.prayer_effectiveness = original_prayer_effectiveness * 0.5
		D.passive_devotion_gain = original_passive_devotion_gain * 0.5
		D.passive_progression_gain = original_passive_progression_gain * 0.5
	else
		D.devotion = 0
		D.prayer_effectiveness = 0
		D.passive_devotion_gain = 0
		D.passive_progression_gain = 0

	to_chat(H, span_boldnotice("I have been excommunicated. I am now unable to gain devotion."))
	return ..()

/datum/status_effect/debuff/apostasy/on_remove()
	. = ..()
	if(ishuman(owner))
		var/mob/living/carbon/human/H = owner
		if(H.devotion)
			var/datum/devotion/D = H.devotion
			D.devotion = original_devotion
			D.prayer_effectiveness = original_prayer_effectiveness
			D.passive_devotion_gain = original_passive_devotion_gain
			D.passive_progression_gain = original_passive_progression_gain

		to_chat(H, span_boldnotice("I have been welcomed back to the Church. I am now able to gain devotion again."))

/atom/movable/screen/alert/status_effect/debuff/apostasy
	name = "Apostasy!"
	desc = "Shame upon the member of clergy!"
	icon_state = "debuff"
	color ="#7a0606"

/datum/status_effect/debuff/hereticsermon
	id = "Heretic on sermon!"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hereticsermon
	effectedstats = list(STATKEY_INT = -2, STATKEY_SPD = -2, STATKEY_LCK = -2)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/debuff/hereticsermon
	name = "Heretic on sermon!"
	desc = "I was on the sermon. My patron is not proud of me."
	icon_state = "debuff"
	color ="#af9f9f"

/datum/status_effect/debuff/lost_naledi_mask
	id = "naledimask"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/naledimask
	effectedstats = list(STATKEY_WIL = -3, STATKEY_LCK = -3)

/atom/movable/screen/alert/status_effect/debuff/naledimask
	name = "Lost Mask"
	desc = "Djinns and daemons may claim me at any moment without the mask. It is not safe."
	icon_state = "muscles"

/datum/status_effect/debuff/lost_shaman_hood
	id = "naledimask"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/shamanhood
	effectedstats = list(STATKEY_WIL = -3, STATKEY_LCK = -3)

/atom/movable/screen/alert/status_effect/debuff/shamanhood
	name = "Lost Hood"
	desc = "The sacred hood is lost. I feel frail and sapped without it."

///////////////////////
/// CLIMBING STUFF ///
/////////////////////

/// OPEN SPACE TURF BASED CLIMBING, MOB DRAG-DROP TILE
/datum/status_effect/debuff/climbing_lfwb
	id = "climbing_lfwb"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/climbing_lfwb
	tick_interval = 10
	var/stamcost = 30
	var/stamcost_final = 30
	var/mob/living/carbon/human/climber

/datum/status_effect/debuff/climbing_lfwb/on_creation(mob/living/new_owner, new_stamcost)
    stamcost = new_stamcost
    return ..()

/datum/status_effect/debuff/climbing_lfwb/on_apply()
	. = ..()
	climber = owner
	climber.climbing = TRUE
	climber.put_in_hands(new /obj/item/clothing/wall_grab, TRUE, FALSE, TRUE) // gotta have new before /obj/... , otherwise its gonna die

/datum/status_effect/debuff/climbing_lfwb/tick() // do we wanna do this shit every single second? I guess we do boss
	. = ..()
	climber = owner
	if((istype(climber.backr, /obj/item/clothing/climbing_gear)) || (istype(climber.backl, /obj/item/clothing/climbing_gear)))
		stamcost_final = stamcost / 2
		climber.stamina_add(stamcost_final) // every tick interval this much stamina is deducted
	else
		stamcost_final = stamcost
		climber.stamina_add(stamcost_final) // every tick interval this much stamina is deducted
//	to_chat(climber, span_warningbig("[stamcost_final] REMOVED!")) // debug msg
	var/turf/tile_under_climber = climber.loc
	var/list/random_shit_under_climber = list()
	for(var/obj/structure/flora/newbranch/branch in climber.loc)
		random_shit_under_climber += branch
	for(var/obj/machinery/light/rogue/chand/chandelier in climber.loc)
		random_shit_under_climber += chandelier
	for(var/obj/structure/kybraxor/fucking_hatch in climber.loc)
		random_shit_under_climber += fucking_hatch
	if(!istype(tile_under_climber, /turf/open/transparent/openspace))// if we aren't on open space turf, remove debuff (aka our feet are on solid shi or water)
		climber.remove_status_effect(/datum/status_effect/debuff/climbing_lfwb)
	if(random_shit_under_climber.len) // branches dont remove open space turf, so we have to check for it separately
		climber.remove_status_effect(/datum/status_effect/debuff/climbing_lfwb)
	else if(climber.stamina >= climber.max_stamina) // if we run out of green bar stamina, we fall
		to_chat(climber, span_dead("I can't hold onto the ledge for any longer!"))
		climber.remove_status_effect(/datum/status_effect/debuff/climbing_lfwb)
		tile_under_climber.zFall(climber)


/datum/status_effect/debuff/climbing_lfwb/on_remove()
	. = ..()
	climber = owner
	climber.climbing = FALSE
	climber.reset_offsets("wall_press")
	if(climber.is_holding_item_of_type(/obj/item/clothing/wall_grab)) // the slop slops itself holy shit
		for(var/obj/item/clothing/wall_grab/I in climber.held_items)
			if(istype(I, /obj/item/clothing/wall_grab))
				qdel(I)
				return

/atom/movable/screen/alert/status_effect/debuff/climbing_lfwb
	name = "Climbing..."
	desc = "Guess what, you are climbing, buddy."
	icon_state = "muscles"

/datum/status_effect/debuff/mesmerised
	id = "mesmerised"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/mesmerised
	effectedstats = list(STATKEY_STR = -2, STATKEY_LCK = -2, STATKEY_PER = -2, STATKEY_SPD = -2)
	duration = 30 SECONDS

/atom/movable/screen/alert/status_effect/debuff/mesmerised
	name = "Mesmerised"
	desc = span_warning("Their beauty is otherwordly..")
	icon_state = "acid"

/datum/status_effect/debuff/liver_failure
	id = "liver_failure"
	alert_type = null
	tick_interval = -1
	status_type = STATUS_EFFECT_UNIQUE

/datum/status_effect/debuff/liver_failure/on_apply()
	if(!iscarbon(owner))
		return FALSE

	RegisterSignal(owner, COMSIG_LIVING_LIFE, PROC_REF(on_life))
	return ..()

/datum/status_effect/debuff/liver_failure/on_remove()
	UnregisterSignal(owner, COMSIG_LIVING_LIFE)
	return ..()

/datum/status_effect/debuff/liver_failure/proc/on_life(mob/living/carbon/carbon, seconds, times_fired)
	SIGNAL_HANDLER

	INVOKE_ASYNC(carbon, TYPE_PROC_REF(/mob/living/carbon, liver_failure))

/datum/status_effect/debuff/orgasmbroken
	id = "orgasmbroken"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/orgasmbroken
	effectedstats = list("intelligence" = -10, "strength" = -2, "speed" = -2, "perception" = -5, "endurance" = 2, "constitution" = -2)
	duration = -1

/datum/status_effect/debuff/orgasmbroken/on_apply()
	. = ..()
	owner.add_movespeed_modifier("ORGASM_SLOWDOWN", multiplicative_slowdown=4)

/datum/status_effect/debuff/orgasmbroken/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("ORGASM_SLOWDOWN")

/atom/movable/screen/alert/status_effect/debuff/orgasmbroken
	name = "Orgasm Broken"
	desc = "My legs are shaking, but I need more."
	icon_state = "fentanyl"

/datum/status_effect/debuff/nympho_addiction
	id = "nympho_addiction"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/nympho_addiction
	//effectedstats = list("intelligence" = -20, "strength" = -8, "speed" = -6, "perception" = -5, "endurance" = 2, "constitution" = -2)
	duration = -1

/datum/status_effect/debuff/nympho_addiction/on_apply()
	. = ..()
	var/mob/living/carbon/human/human = owner
	human.charflaw = new /datum/charflaw/addiction/lovefiend(human)

/atom/movable/screen/alert/status_effect/debuff/nympho_addiction
	name = "Addicted to Sex"
	desc = "I want to do it again. And again. And again."
	icon_state = "debuff"

/datum/status_effect/debuff/cumbrained
	id = "cumbrained"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cumbrained
	effectedstats = list("intelligence" = -10, "strength" = -6, "speed" = -6)
	duration = -1

/atom/movable/screen/alert/status_effect/debuff/cumbrained
	name = "Cum Brained"
	desc = "It's hard to think..."
	icon_state = "debuff"

/datum/status_effect/debuff/cumbrained/process()
	. = ..()
	if(owner.mob_timers["cumbrained_ticker"])
		if(world.time < owner.mob_timers["cumbrained_ticker"] + rand(30,90)SECONDS)
			return
	owner.mob_timers["cumbrained_ticker"] = world.time
	if(!owner)
		return
	if(owner.sexcon.arousal < 40)
		owner.sexcon.arousal += rand(25, 35) //so it instantly fully arouses
	else
		owner.sexcon.arousal += rand(5, 15)
	to_chat(owner, span_love("My body wants more..."))

/datum/status_effect/debuff/loinspent/process()
	. = ..()
	if(owner.mob_timers["chafing_loins"])
		if(world.time < owner.mob_timers["chafing_loins"] + rand(20,90)SECONDS)
			return
	owner.mob_timers["chafing_loins"] = world.time
	if(!owner)
		return
	var/mob/living/carbon/human/human = owner
	if(human.underwear)
		if(rand(5))
			to_chat(human, span_love("I feel [human.underwear] rub against me..."))
		human.sexcon.arousal += rand(10,20)
	else if(human.wear_pants)
		if(human.wear_pants.flags_inv & HIDECROTCH && !human.wear_pants.genitalaccess)
			if(rand(5))
				to_chat(human, span_love("I feel [human.wear_pants] rub against me..."))
			human.sexcon.arousal += rand(5,10)
	
/datum/status_effect/debuff/loinspent
	id = "loinspent"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/loinspent
	duration = -1

/atom/movable/screen/alert/status_effect/debuff/loinspent
	name = "Spent Loins"
	desc = "It's starting to hurt a bit..."
	icon_state = "debuff"

/datum/status_effect/debuff/bigboobs
	id = "bigboobs"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bigboobs
	examine_text = span_notice("They have massive MAGICAL GOODS!")
	effectedstats = list("constitution" = 3,"endurance" = -2, "speed" = -1)
	duration = 10 MINUTES
	var/initialpenis
	var/initialbutt
	var/initialball
	var/initialbreasts
	var/nodrawback = FALSE

/datum/status_effect/debuff/bigboobs/permanent
	duration = -1 //used for quirk
/*
/datum/status_effect/debuff/bigboobs/permanent/lite
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bigboobslite
	examine_text = span_notice("They have massive GOODS!")
	nodrawback = TRUE
	effectedstats = null*/

/atom/movable/screen/alert/status_effect/debuff/bigboobs
	name = "Enchanted Endowment" //was gonna name it a curse but it isn't a technically one.
	desc = "They feel as heavy as gold and are massive... My back hurts."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bigboobs"
/*
/atom/movable/screen/alert/status_effect/debuff/bigboobslite
	name = "Natural Endowment"
	desc = "I got unusually large, natural bits, they aren't as heavy as an enchanted one thankfully."
	icon = 'modular_stonehedge/licensed-eaglephntm/icons/mob/screen_alert.dmi'
	icon_state = "bigboobslite"
*/
/datum/status_effect/debuff/bigboobs/on_apply()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	/*if(nodrawback)
		ADD_TRAIT(user, TRAIT_ENDOWMENTLITE, id)
	else
		ADD_TRAIT(user, TRAIT_ENDOWMENT, id)*/
	to_chat(user, span_warning("Gah! my [user.gender == FEMALE ? "TITS" : "JUNK"] expand to impossible sizes!"))
	//max them out.
	for(var/obj/item/organ/forgan as anything in user.internal_organs) //as anything cause i either do this or use for() twice which is i guess worse.
		if(istype(forgan, /obj/item/organ/penis))
			initialpenis = forgan.organ_size
			forgan.organ_size = TOTAL_PENIS_SIZE
			continue
		/*if(istype(forgan, /obj/item/organ/butt))
			initialbutt = forgan.organ_size
			forgan.organ_size = TOTAL_BUTT_SIZE
			continue*/
		if(istype(forgan, /obj/item/organ/filling_organ/testicles))
			initialball = forgan.organ_size
			forgan.organ_size = TOTAL_TESTICLES_SIZE
			continue
		if(istype(forgan, /obj/item/organ/filling_organ/breasts))
			initialbreasts = forgan.organ_size
			forgan.organ_size = TOTAL_BREASTS_SIZE - 2
			continue
		continue
	user.update_body_parts(TRUE)
	//drop our unwearable equipment to the floor.
	/*if(user.gender == MALE)
		var/obj/item/clothing/thepants = user.wear_pants
		if(thepants && !thepants?.can_hold_endowed)
			user.dropItemToGround(thepants)
	else
		var/obj/item/clothing/theshirt = user.wear_shirt
		var/obj/item/clothing/thearmor = user.wear_armor
		if(theshirt && !theshirt?.can_hold_endowed)
			user.dropItemToGround(theshirt)
		if(thearmor && !thearmor?.can_hold_endowed)
			user.dropItemToGround(thearmor)*/

/datum/status_effect/debuff/bigboobs/on_remove()
	. = ..()
	var/mob/living/carbon/human/species/user = owner
	if(!user)
		return
	//REMOVE_TRAIT(user, TRAIT_ENDOWMENT, id)
	to_chat(user, span_notice("Phew, My bits shrunk back to the way they were."))
	//return to pref sizes.
	for(var/obj/item/organ/forgan as anything in user.internal_organs)
		if(istype(forgan, /obj/item/organ/penis))
			forgan.organ_size = initialpenis
			continue
		/*if(istype(forgan, /obj/item/organ/butt))
			forgan.organ_size = initialbutt
			continue*/
		if(istype(forgan, /obj/item/organ/filling_organ/testicles))
			forgan.organ_size = initialball
			continue
		if(istype(forgan, /obj/item/organ/filling_organ/breasts))
			forgan.organ_size = initialbreasts
			continue
		continue
	user.update_body_parts(TRUE)



/datum/status_effect/knot_tied
	id = "knot_tied"
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/knot_tied
	effectedstats = list("strength" = -5, "constitution" = -3, "endurance" = -3, "speed" = -5)

/atom/movable/screen/alert/status_effect/knot_tied
	name = "Knotted"
	desc = "I feel their knot throb inside of me, I find it hard to walk."

/datum/status_effect/knot_fucked_stupid
	id = "knot_fucked_stupid"
	duration = 2 MINUTES
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/knot_fucked_stupid
	effectedstats = list("intelligence" = -10)

/atom/movable/screen/alert/status_effect/knot_fucked_stupid
	name = "Fucked Stupid"
	desc = "Mmmph I can't think straight..."

/datum/status_effect/knot_gaped
	id = "knot_gaped"
	duration = 60 SECONDS
	tick_interval = 100 // every 10 seconds
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/knot_gaped
	effectedstats = list("strength" = -1, "speed" = -2, "intelligence" = -1)
	var/last_loc

/datum/status_effect/knot_gaped/on_apply()
	last_loc = get_turf(owner)
	return ..()

/datum/status_effect/knot_gaped/tick()
	var/cur_loc = get_turf(owner)
	if(get_dist(cur_loc, last_loc) <= 5) // too close, don't spawn a puddle
		return
	add_cum_floor(get_turf(owner))
	playsound(owner, pick('sound/misc/bleed (1).ogg', 'sound/misc/bleed (2).ogg', 'sound/misc/bleed (3).ogg'), 50, TRUE, -2, ignore_walls = FALSE)
	last_loc = cur_loc

/atom/movable/screen/alert/status_effect/knot_gaped
	name = "Gaped"
	desc = "You were forcefully withdrawn from. Warmth runs freely down your thighs..."

/datum/status_effect/knotted
	id = "knotted"
	status_type = STATUS_EFFECT_UNIQUE
	alert_type = /atom/movable/screen/alert/status_effect/knotted

/atom/movable/screen/alert/status_effect/knotted
	name = "Knotted"
	desc = "I have to be careful where I step..."

/datum/status_effect/facial
	id = "facial"
	alert_type = null // don't show an alert on screen
	duration = 12 MINUTES // wear off eventually or until character washes themselves

/datum/status_effect/facial/internal
	id = "creampie"
	alert_type = null // don't show an alert on screen
	duration = 7 MINUTES // wear off eventually or until character washes themselves

/datum/status_effect/facial/on_apply()
	RegisterSignal(owner, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_COMPONENT_CLEAN_FACE_ACT),PROC_REF(clean_up))
	return ..()

/datum/status_effect/facial/on_remove()
	UnregisterSignal(owner, list(COMSIG_COMPONENT_CLEAN_ACT, COMSIG_COMPONENT_CLEAN_FACE_ACT))
	return ..()

///Callback to remove pearl necklace
/datum/status_effect/facial/proc/clean_up(datum/source, strength)
	if(strength >= CLEAN_WEAK && !QDELETED(owner))
		if(!owner.has_stress_event(/datum/stressevent/bathcleaned))
			to_chat(owner, span_notice("I feel much cleaner now!"))
			owner.add_stress(/datum/stressevent/bathcleaned)
		owner.remove_status_effect(src)


/datum/status_effect/edged_penis_cooldown
	id = "tired_penis"
	alert_type = null
	duration = 7 MINUTES

/datum/status_effect/blue_bean
	id = "blue_bean"
	alert_type = null
	duration = -1

/datum/status_effect/blue_balls
	id = "blue_balls"
	alert_type = null
	duration = -1

/datum/status_effect/edging_overstimulation
	id = "edging_overstimulation"
	duration = 5 MINUTES
	alert_type = /atom/movable/screen/alert/status_effect/edging_overstimulation
	effectedstats = list("strength" = -1, "speed" = -2, "intelligence" = -2)

/atom/movable/screen/alert/status_effect/edging_overstimulation
	name = "Overstimulated"
	desc = "I have been going at it for too long without release, I need relief..."
