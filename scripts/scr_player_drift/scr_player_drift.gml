function scr_player_drift(){
    // when the car leaves the road, slow it down more and make steering sluggish
    if (!scr_on_road(x,y))
    {
        spd *= 0.92;
        // optionally, we could reduce turning power here if needed (handled in scr_player_move via turn_factor)
    }
}