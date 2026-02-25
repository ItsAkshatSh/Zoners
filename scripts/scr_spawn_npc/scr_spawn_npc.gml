function scr_spawn_npc(){
	for (var i=0;i<5;i++)
	{
		instance_create_layer(irandom(room_width),irandom(room_height),"Instances",oNPC);
	}
}