function scr_game_manager(){
	caption = "Score: " + string(global.score);

	if (instance_exists(global.delivery_target) == false)
	{
		scr_generate_delivery();
	}
}