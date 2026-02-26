function scr_player_drift(){
    
    if (!scr_on_road(x,y))
    {
        spd *= 0.92;
        
    }
}