function scr_solid_at(_x, _y)
{
    // Buildings
    var tm = layer_tilemap_get_id("BuildingTiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    // Fences
    tm = layer_tilemap_get_id("FencesTiles");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    // Terrain boundary (e.g. water / out-of-bounds)
    tm = layer_tilemap_get_id("TerrainBoundary");
    if (tm != -1 && tilemap_get_at_pixel(tm, _x, _y) != 0) return true;

    // Junkyard area should block vehicles too
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
