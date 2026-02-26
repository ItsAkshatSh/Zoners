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

        // position the arrow at the top‑center of the screen
        var ax = cx + vw * 0.5;
        var ay = cy + 40;

        // make a clear arrow shape
        var tip_len  = 18;
        var base_len = 10;
        var half_w   = 8;

        var tip_x  = ax + lengthdir_x(tip_len, angle);
        var tip_y  = ay + lengthdir_y(tip_len, angle);
        var base_x = ax + lengthdir_x(base_len, angle + 180);
        var base_y = ay + lengthdir_y(base_len, angle + 180);

        var left_x  = base_x + lengthdir_x(half_w, angle - 90);
        var left_y  = base_y + lengthdir_y(half_w, angle - 90);
        var right_x = base_x + lengthdir_x(half_w, angle + 90);
        var right_y = base_y + lengthdir_y(half_w, angle + 90);

        draw_set_color(c_orange);
        draw_triangle(tip_x, tip_y, left_x, left_y, right_x, right_y, false);
    }
}

// clean up
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_set_color(c_white);
