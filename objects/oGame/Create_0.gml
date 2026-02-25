global.score = 0;
global.delivery_target = noone;

// reduce the built‑in view size so the camera actually follows the car instead
// of displaying the entire room (room width is 2048).  This will zoom the view
// to something more sensible for play testing.
var cam = view_camera[0];
if (cam != noone)
{
    var vw = min(1024, room_width);
    var vh = min(768, room_height);
    camera_set_view_size(cam, vw, vh);
    camera_set_view_pos(cam,0,0);
}

scr_spawn_npc();
scr_generate_delivery();