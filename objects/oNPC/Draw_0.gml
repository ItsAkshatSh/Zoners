// draw NPC sprite normally
draw_self();

// if player is nearby, show an interaction prompt
var p = instance_find(oPlayer, 0);
if (p != noone)
{
    var pd = point_distance(x, y, p.x, p.y);
    if (pd < 64)
    {
        draw_set_halign(fa_center);
        draw_set_valign(fa_middle);
        draw_set_color(c_white);
        draw_text(x, y - sprite_get_height(sprite_index) * 0.8, "Press E to talk");
        draw_set_halign(fa_left);
        draw_set_valign(fa_top);
    }
}
