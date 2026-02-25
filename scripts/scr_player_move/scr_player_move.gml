function scr_player_move()
{
    var previous_x = x;
    var previous_y = y;

    // 1. INPUT
    var accel_input = keyboard_check(vk_up);
    var brake_input = keyboard_check(vk_down);
    var left_input  = keyboard_check(vk_left);
    var right_input = keyboard_check(vk_right);

    // 2. ACCELERATION & BRAKING
    if (accel_input) spd += acc;
    if (brake_input) spd -= acc * 0.8;

    // 3. FRICTION (Smoother stopping)
    if (!accel_input && !brake_input)
    {
        // lerp creates a snappier, less "floaty" slowdown than straight multiplication
        spd = lerp(spd, 0, 0.05); 
        if (abs(spd) < 0.1) spd = 0;
    }

    // LIMIT SPEED
    spd = clamp(spd, -max_spd, max_spd);

    // 4. 🚗 STEERING LOGIC
    // turning velocity was initialized in Create event
    var turn_acc = 0.2;

    // left arrow should rotate counter‑clockwise, right arrow clockwise
    if (left_input)  turn_vel += turn_acc;
    if (right_input) turn_vel -= turn_acc;

    // slow down turning when keys are released
    if (!left_input && !right_input)
        turn_vel = lerp(turn_vel, 0, 0.1);

    // limit how fast the car can rotate
    turn_vel = clamp(turn_vel, -turn_spd, turn_spd);

    // if moving backwards reverse steering
    var steer_mult = (spd < 0) ? -1 : 1;

    dir += turn_vel * steer_mult;

    // optional: reduce turn_vel at low speed to prevent spinning in place
    if (abs(spd) < 0.5)
        turn_vel *= 0.5;

    // 5. MOVE
    x += lengthdir_x(spd, dir);
    y += lengthdir_y(spd, dir);

    // 6. COLLISION
    if (scr_solid_at(x, y))
    {
        x = previous_x;
        y = previous_y;
        spd *= -0.3; // Slight bounce
    }

    // 7. SPRITE DIRECTION
    image_speed = 0;

    var norm_dir = dir mod 360;
    if (norm_dir < 0) norm_dir += 360;

    // round() instead of floor() snaps the visuals much more cleanly
    var octant = round(norm_dir / 45) mod 8;

    switch (octant)
    {
        // Corrected for GM's angle system (90 is UP, 270 is DOWN)
        case 0: sprite_index = spr_car_right; break;
        case 1: sprite_index = spr_car_up_right; break;
        case 2: sprite_index = spr_car_up; break;
        case 3: sprite_index = spr_car_top_left; break; // Restored your exact sprite name
        case 4: sprite_index = spr_car_left; break;
        case 5: sprite_index = spr_car_down_left; break;
        case 6: sprite_index = spr_car_down; break;
        case 7: sprite_index = spr_car_down_right; break;
    }
}