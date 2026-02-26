// simple wandering behaviour
if (!variable_instance_exists(id,"target_x"))
{
    target_x = irandom(room_width);
    target_y = irandom(room_height);
}

var d = point_distance(x, y, target_x, target_y);

if (d < 5)
{
    target_x = irandom(room_width);
    target_y = irandom(room_height);
}

var dir = point_direction(x, y, target_x, target_y);
// x += lengthdir_x(spd, dir);
// y += lengthdir_y(spd, dir);

// interaction with player
var p = instance_find(oPlayer, 0);
if (p != noone)
{
    var pd = point_distance(x, y, p.x, p.y);

    if (pd < 64 && keyboard_check_pressed(ord("E")))
    {
        // talk to NPC -> spawn / reset delivery marker on road
        scr_generate_delivery();
    }
}