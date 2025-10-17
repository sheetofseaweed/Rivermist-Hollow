/datum/examine_panel
	/// Mob that the examine panel belongs to.
	var/mob/living/carbon/human/holder
	/// The screen containing the appearance of the mob
	var/atom/movable/screen/map_view/examine_panel_screen/examine_panel_screen

	var/datum/preferences/pref = null

	var/is_playing = FALSE

	var/mob/viewing

/datum/examine_panel/New(mob/holder_mob)
	if(holder_mob)
		holder = holder_mob

/datum/examine_panel/Destroy(force)
	holder = null
	viewing = null
	qdel(examine_panel_screen)
	return ..()

/datum/examine_panel/ui_state(mob/user)
	return GLOB.always_state

/atom/movable/screen/map_view/examine_panel_screen
	name = "examine panel screen"

/datum/examine_panel/ui_interact(mob/user, datum/tgui/ui)
	ui = SStgui.try_update_ui(user, src, ui)
	if(!ui)
		ui = new(user, src, "ExaminePanel")
		ui.open()

/datum/examine_panel/ui_data(mob/user)

	var/flavor_text
	var/flavor_text_nsfw
	var/obscured
	var/ooc_notes = ""
	var/ooc_notes_nsfw
	var/headshot = ""
	var/list/img_gallery = list()
	var/char_name
	var/song_url
	var/has_song = FALSE
	var/is_vet = FALSE
	var/is_naked = FALSE

	if(ishuman(holder))
		var/mob/living/carbon/human/holder_human = holder
		if(!(holder.wear_armor && holder.wear_armor.flags_inv) && !(holder.wear_shirt && holder.wear_shirt.flags_inv))
			is_naked = TRUE
		obscured = ((!isobserver(user)) && !holder_human.client?.prefs?.masked_examine) && ((holder_human.wear_mask && (holder_human.wear_mask.flags_inv & HIDEFACE)) || (holder_human.head && (holder_human.head.flags_inv & HIDEFACE)))
		flavor_text = obscured ? "Obscured" : holder.flavortext
		flavor_text_nsfw = obscured ? "Obscured" : holder.nsfwflavortext
		ooc_notes += holder.ooc_notes
		ooc_notes_nsfw += holder.erpprefs
		char_name = holder.name
		song_url = holder.ooc_extra
		//is_vet = holder.check_agevet()
		if(!obscured)
			headshot += holder.headshot_link
			img_gallery = holder.img_gallery
		if(!holder.headshot_link)
			headshot = "headshot_red.png"

	else if(pref)
		is_naked = TRUE
		obscured = FALSE
		flavor_text = pref.flavortext
		flavor_text_nsfw = pref.nsfwflavortext
		ooc_notes = pref.ooc_notes
		ooc_notes_nsfw = pref.erpprefs
		headshot = pref.headshot_link
		img_gallery = pref.img_gallery
		char_name = pref.real_name
		song_url = pref.ooc_extra
		//is_vet = viewing.check_agevet()
		if(!headshot)
			headshot = "headshot_red.png"
	
	if(song_url)
		has_song = TRUE

	ooc_notes = html_encode(ooc_notes)
	ooc_notes = parsemarkdown_basic(ooc_notes, hyperlink=TRUE)
	ooc_notes_nsfw = html_encode(ooc_notes_nsfw)
	ooc_notes_nsfw = parsemarkdown_basic(ooc_notes_nsfw, hyperlink=TRUE)
	flavor_text = html_encode(flavor_text)
	flavor_text = parsemarkdown_basic(flavor_text, hyperlink=TRUE)
	flavor_text_nsfw = html_encode(flavor_text_nsfw)
	flavor_text_nsfw = parsemarkdown_basic(flavor_text_nsfw, hyperlink=TRUE)

	var/list/data = list(
		// Identity
		"character_name" = obscured ? "Unknown" : char_name,
		"headshot" = headshot,
		"obscured" = obscured ? TRUE : FALSE,
		// Descriptions
		"flavor_text" = flavor_text,
		"ooc_notes" = ooc_notes,
		// Descriptions, but requiring manual input to see
		"flavor_text_nsfw" = flavor_text_nsfw,
		"ooc_notes_nsfw" = ooc_notes_nsfw,
		"img_gallery" = img_gallery,
		"is_playing" = is_playing,
		"has_song" = has_song,
		"is_vet" = is_vet,
		"is_naked" = is_naked,
	)
	return data
///DO THIS SOMETIME
/*var/mob/user = usr
		var/list/dat = list()
		dat += "<div align='center'><font size = 5; font color = '#dddddd'><b>[src]</b></font></div>"
		var/legacy_check = FALSE
		if(isnull(flavortext_display) && !isnull(flavortext))
			if(isnull(client.prefs?.flavortext_display))	// They're both null, meaning this is a legacy char being examined.
				is_legacy = TRUE		//We toggle it on in prefs and on mob
				client.prefs.is_legacy = TRUE
				legacy_check = TRUE
				client.prefs?.flavortext_display = replacetext(flavortext, "\n", "<BR>")	//We only do the basic legacy conversion
				flavortext_display = client.prefs?.flavortext_display
			else
				flavortext_display = client.prefs?.flavortext_display	//In this case, something went wrong and we can fix it.
		if(isnull(ooc_notes_display) && !isnull(ooc_notes))		// Ditto for OOC notes.
			if(isnull(client.prefs?.ooc_notes_display))
				is_legacy = TRUE
				client.prefs.is_legacy = TRUE
				legacy_check = TRUE
				client.prefs?.ooc_notes_display = replacetext(ooc_notes, "\n", "<BR>")
				ooc_notes_display = client.prefs?.ooc_notes_display
			else
				ooc_notes_display = client.prefs?.ooc_notes_display
		if(legacy_check)	//If this is how a Legacy char was established, we save it.
			client.prefs?.save_character()
		if(is_legacy)
			dat += "<center><i><font color = '#b9b9b9'; font size = 1>This is a LEGACY profile from the naive daes of Psydon!</font></i></center>"
		//var/agevetted = client.check_agevet()
		//if(agevetted)
			//dat += "<center><i><font color = '#74cde0'; font size = 1>This profile belongs to an AGE-VERIFIED traveler of Azuria!</font></i></center>"
		if(valid_headshot_link(null, headshot_link, TRUE))
			dat += ("<div align='center'><img src='[headshot_link]' width='325px' height='325px'></div>")
		if(flavortext)
			dat += "<br>"
			dat += "<div align='left'>[flavortext_display]</div>"
		if(ooc_notes)
			dat += "<br>"
			dat += "<div align='center'><b>OOC notes</b></div>"
			dat += "<div align='left'>[ooc_notes_display]</div>"
		if(ooc_extra)
			dat += "<div align='center'>[ooc_extra]</div>"
		if(nsfw_headshot_link)
			dat += "<br><div align='center'><b>NSFW</b></div>"
		if(nsfw_headshot_link && !wear_armor && !wear_shirt)
			dat += ("<br><div align='center'><img src='[nsfw_headshot_link]' width='600px'></div>")
		else if(nsfw_headshot_link && (wear_armor || wear_shirt))
			dat += "<br><center><i><font color = '#9d0080'; font size = 5>There is more to see but they are not naked...</font></i></center>"
		var/datum/browser/popup = new(user, "[src]", nwidth = 700, nheight = 800)
		popup.set_content(dat.Join())
		popup.open(FALSE)*/

/datum/examine_panel/ui_act(action, list/params, datum/tgui/ui, datum/ui_state/state)
	. = ..()

	if(.)
		return

	if(!viewing)
		return

	var/client/C
	var/web_sound_url
	var/artist_name = "Song Artist Hidden"
	var/song_title
	var/list/music_extra_data = list()
	
	C = viewing.client

	if(ishuman(holder))
		web_sound_url = holder.ooc_extra
		if(holder.song_artist)
			artist_name = holder.song_artist
		song_title = holder.song_title

	else if(pref)
		web_sound_url= pref.ooc_extra
		if(pref.song_artist)
			artist_name = pref.song_artist
		song_title = pref.song_title

	if(!C || !web_sound_url)
		return

	if(!web_sound_url)
		return

	switch(action)
		if("toggle")
			if(!is_playing)
				is_playing = TRUE
				music_extra_data["link"] = web_sound_url
				music_extra_data["title"] = song_title
				music_extra_data["duration"] = "Song Duration Hidden"
				music_extra_data["artist"] = artist_name
				C.tgui_panel?.play_music(web_sound_url, music_extra_data)
			else
				is_playing = FALSE
				C.tgui_panel?.stop_music()
			return TRUE
		//if("vet_chat")
		//	to_chat(viewing, span_boldgreen("This player is age-verified!"))
		//	return TRUE

/datum/examine_panel/ui_close()
	viewing.client?.tgui_panel?.stop_music()
	QDEL_NULL(src)

/datum/examine_panel/ui_assets(mob/user)
	return list(
		get_asset_datum(/datum/asset/simple/headshot_imgs),
	)

/datum/asset/simple/headshot_imgs
	assets = list(
		"headshot_background.png" = 'icons/tgui/headshot_background.png',
		"headshot_red.png" = 'icons/tgui/headshot_red.png',
		)
