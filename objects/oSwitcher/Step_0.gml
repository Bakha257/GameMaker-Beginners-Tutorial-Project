if(image_index = image_number - 1 && is_on){
	is_on = false;
	sprite_index = sSwitcher;
	image_speed = 0;
	
	with(oDoor){
		audio_play_sound(soundDoor, 1, false);
		instance_destroy();
	}
}