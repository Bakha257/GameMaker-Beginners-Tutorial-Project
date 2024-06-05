 if (place_meeting(x, y, oBox)){
	box_on_button = true;
}else{
	box_on_button = false;
}
	
if (box_on_button){
	with(oDoor){
		if(other.box_on_button){
			audio_play_sound(soundDoor, 1, false);
			instance_destroy();
		}
	}
}
