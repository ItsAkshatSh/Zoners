function scr_player_move()
{
    var previous_x = x;
    var previous_y = y;
    
    var accel_input = keyboard_check(vk_up) || keyboard_check(ord("W"));
    var brake_input = keyboard_check(vk_down) || keyboard_check(ord("S"));
    var left_input  = keyboard_check(vk_left) || keyboard_check(ord("A"));
    var right_input = keyboard_check(vk_right) || keyboard_check(ord("D"));
    
    if (accel_input) spd += acc;
    if (brake_input) spd -= acc * 0.8;
    if (!accel_input && !brake_input)
    {
        spd = lerp(spd, 0, 0.08);
        if (abs(spd) < 0.1) spd = 0;
    }
    spd = clamp(spd, -max_spd * 0.6, max_spd);
    
    var turn_amount = 0;
    if (left_input)  turn_amount =  turn_spd;
    if (right_input) turn_amount = -turn_spd;
    
    var speed_ratio = clamp(abs(spd) / max_spd, 0, 1);
    var steer_mult  = (spd < 0) ? -1 : 1;
    dir += turn_amount * speed_ratio * steer_mult;
    
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);
    
    if (scr_solid_at(x, y))
    {
        x = previous_x;
        y = previous_y;
        spd *= -0.3;
    }
    
    image_speed = 0;
    sprite_index = spr_car_up;
    image_angle = dir - 90;
}