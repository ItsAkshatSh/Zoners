function scr_solid_at(_x, _y)
{
    
    var tm = layer_tilemap_get_id("BuildingTiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    
    tm = layer_tilemap_get_id("FencesTiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    
    tm = layer_tilemap_get_id("TerrainBoundary");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

   
    tm = layer_tilemap_get_id("JunkyardTiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    // Decorative objects and trees should also be impassable
    tm = layer_tilemap_get_id("DecorTiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;
    tm = layer_tilemap_get_id("Tree1Tiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;
    tm = layer_tilemap_get_id("Tree2Tiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    return false;
}
