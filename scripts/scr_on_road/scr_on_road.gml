function scr_on_road(xx,yy)
{
    var tile = tilemap_get_at_pixel(layer_tilemap_get_id("RoadTiles"),xx,yy);
    return tile != 0;
}