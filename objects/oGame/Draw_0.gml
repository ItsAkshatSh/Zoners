// draw UI elements using the active camera
var cam = view_camera[0];
if (cam == noone) return; // nothing to draw if there's no camera

var cx = camera_get_view_x(cam);
var cy = camera_get_view_y(cam);
var vw = camera_get_view_width(cam);
var vh = camera_get_view_height(cam);

// -- score text --
draw_set_halign(fa_right);
draw_set_valign(fa_top);
draw_set_color(c_white);
draw_text(cx + vw - 16, cy + 16, "Score: " + string(global.score));

// -- arrow pointing toward the current delivery --
if (instance_exists(global.delivery_target))
{
    var p = instance_find(oPlayer, 0);
    if (p != noone)
    {
        var t = global.delivery_target;
        var angle = point_direction(p.x, p.y, t.x, t.y);
        var ax = cx + vw - 32;
        var ay = cy + 32;
        var size = 12;
        draw_set_color(c_orange);
        draw_triangle(ax, ay,
                      ax + lengthdir_x(size, angle-140), ay + lengthdir_y(size, angle-140),
                      ax + lengthdir_x(size, angle+140), ay + lengthdir_y(size, angle+140),
                      false);
    }
}

// clean up
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
