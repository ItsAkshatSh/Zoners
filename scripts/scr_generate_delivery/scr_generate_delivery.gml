function scr_generate_delivery(){
    // fixed sequence of waypoints; the marker will visit each in order
    if (!variable_global_exists("delivery_points"))
    {
        global.delivery_points = [
            [255, 659],
            [1454, 659],
            [1439, 1472],
            [287, 1640]
        ];
        global.delivery_idx = -1;
    }

    // advance index and determine segment endpoints
    global.delivery_idx += 1;
    if (global.delivery_idx >= array_length(global.delivery_points))
        global.delivery_idx = 0;
    var a = global.delivery_points[global.delivery_idx];
    var b = global.delivery_points[(global.delivery_idx + 1) mod array_length(global.delivery_points)];

    // pick a random point along the line segment ab
    var t;
    var xx, yy;
    var tries = 0;
    repeat (true)
    {
        t = random(1);
        xx = a[0] + (b[0] - a[0]) * t;
        yy = a[1] + (b[1] - a[1]) * t;
        tries += 1;
        // avoid spawning on top of the player
        var p = instance_find(oPlayer,0);
        if (p != noone && point_distance(xx,yy,p.x,p.y) < 32) continue;
        // only accept if the location is actually road and not solid
        if (scr_on_road(xx,yy) && !scr_solid_at(xx,yy)) break;
        if (tries > 50) break; // give up and just use the endpoint
    }


    global.delivery_target =
        instance_create_layer(xx,yy,"Instances",oDeliveryMarker);
}