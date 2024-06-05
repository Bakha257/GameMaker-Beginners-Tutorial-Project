// Inherit the parent event
event_inherited();

if(instance_exists(oHelpButton)){
	instance_destroy(oHelpButton)
}else{
	instance_create_layer(room_width/2, room_height/2, "Instances", oHelpButton);
}

