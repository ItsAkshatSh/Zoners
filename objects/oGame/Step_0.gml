var p = instance_find(oPlayer, 0);
if (p != noone)
{
    var cam = view_camera[0];
    if (cam != noone && camera_exists(cam))
    {
        var vw = camera_get_view_width(cam);
        var vh = camera_get_view_height(cam);
        var cx = p.x - vw * 0.5;
        var cy = p.y - vh * 0.5;
        cx = clamp(cx, 0, room_width - vw);
        cy = clamp(cy, 0, room_height - vh);
        camera_set_view_pos(cam, cx, cy);
    }
    else
    {
        // legacy view fallback (shouldn't be needed once cameras are stable)
        var vw = view_wview[0];
        var vh = view_hview[0];
        view_xview[0] = clamp(p.x - vw * 0.5, 0, room_width - vw);
        view_yview[0] = clamp(p.y - vh * 0.5, 0, room_height - vh);
    }
}
