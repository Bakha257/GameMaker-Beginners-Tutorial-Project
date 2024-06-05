var moveX = 0;
var moveY = 0;

if(keyboard_check(vk_left)) {
	moveX = -3;
	sprite_index = sPlayerLeft;
	image_speed = 1;
} else if(keyboard_check(vk_right)){
	moveX = 3;
	sprite_index = sPlayerRight;
	image_speed = 1;
}

if(keyboard_check(vk_up)) {
	moveY = -3;
	sprite_index = sPlayerUp;
	image_speed = 1;
} else if(keyboard_check(vk_down)){
	moveY = 3;
	sprite_index = sPlayerDown;
	image_speed = 1;
}

if(!keyboard_check(vk_left) && !keyboard_check(vk_right) && sprite_index != sPlayerSpawn){
	moveX = 0;
	if(moveY = 0){
		sprite_index = sPlayerIdle;
		image_speed = 1;
	}
}

if(!keyboard_check(vk_up) && !keyboard_check(vk_down) && sprite_index != sPlayerSpawn){
	moveY = 0;
	if(moveX = 0){
		sprite_index = sPlayerIdle;
		image_speed = 1;
	}
}

if(moveX != 0){
	if(!place_meeting(x + moveX,y, oWallEdge)){
		x += moveX;
	}
}

if(moveY != 0){
	if(!place_meeting(x, y  + moveY, oWallEdge)){
		y += moveY;
	}
}

if (keyboard_check_pressed(ord("E"))){
	if(grabbed_object != noone){
		audio_play_sound(soundPutDown, 1, false);
		grabbed_object = noone;
		}else{
			var obj = instance_nearest(x, y, oBox);
			if (obj != noone && distance_to_object(obj) <= global.grab_distance){
				audio_play_sound(soundPickUp, 1, false);
				grabbed_object = obj;
			}
			
			var key = instance_nearest(x, y, oKey);
			if(key != noone && distance_to_object(key) <= global.grab_distance){
				has_key = true;
				audio_play_sound(soundKey, 1, false);
				instance_destroy(key);
			}
		}
}

if (grabbed_object != noone) {
	grabbed_object.x = x;
	grabbed_object.y = y;
}

var door = instance_nearest(x, y, oDoor);
if(door != noone && distance_to_object(door) <= global.grab_distance){
	if(has_key){
		audio_play_sound(soundDoor, 1, false);
		instance_destroy(door);
	}
}

if(place_meeting(x, y, oDoor)){
	if(!has_key){
		x = xprevious;
		y = yprevious;
	}
}

if(keyboard_check_pressed(ord("E"))){
	var switcher = instance_nearest(x, y, oSwitcher);
	if(switcher != noone && distance_to_object(switcher) <= global.grab_distance){
		if(!switcher.is_on) {
			switcher.is_on = true;
			switcher.sprite_index = sSwitcher;
			switcher.image_speed = 1;
			switcher.alarm[0] = 60;
		}
	}
}

if(place_meeting(x, y, oTransitionZone)){
	room_goto(rm_Room2);
}

if(place_meeting(x, y, oTransitionZone2)){
	room_goto(rm_Room3);
}
