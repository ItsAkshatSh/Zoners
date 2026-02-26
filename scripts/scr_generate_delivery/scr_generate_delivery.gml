function scr_generate_delivery(){
    var corners = [
        [1410,1440],
        [289,1566],
        [290,701],
        [1437,704]
    ];

   
    var minx = corners[0][0];
    var maxx = minx;
    var miny = corners[0][1];
    var maxy = miny;
    for (var i = 1; i < array_length(corners); ++i)
    {
        minx = min(minx, corners[i][0]);
        maxx = max(maxx, corners[i][0]);
        miny = min(miny, corners[i][1]);
        maxy = max(maxy, corners[i][1]);
    }


    var xx, yy;
    var tries = 0;
    repeat (true)
    {
        xx = irandom_range(minx, maxx);
        yy = irandom_range(miny, maxy);
        tries += 1;

        var a = corners[0];
        var b = corners[1];
        var c = corners[2];
        var d = corners[3];
        var in_quad = false;

        {
            var px = xx - a[0], py = yy - a[1];
            var v0x = c[0] - a[0], v0y = c[1] - a[1];
            var v1x = b[0] - a[0], v1y = b[1] - a[1];
            var dot00 = v0x*v0x + v0y*v0y;
            var dot01 = v0x*v1x + v0y*v1y;
            var dot02 = v0x*px   + v0y*py;
            var dot11 = v1x*v1x + v1y*v1y;
            var dot12 = v1x*px   + v1y*py;
            var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
            var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
            var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
            if ((u >= 0) && (v >= 0) && (u + v < 1)) in_quad = true;
        }

        if (!in_quad)
        {
            var px = xx - a[0], py = yy - a[1];
            var v0x = d[0] - a[0], v0y = d[1] - a[1];
            var v1x = c[0] - a[0], v1y = c[1] - a[1];
            var dot00 = v0x*v0x + v0y*v0y;
            var dot01 = v0x*v1x + v0y*v1y;
            var dot02 = v0x*px   + v0y*py;
            var dot11 = v1x*v1x + v1y*v1y;
            var dot12 = v1x*px   + v1y*py;
            var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
            var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
            var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
            if ((u >= 0) && (v >= 0) && (u + v < 1)) in_quad = true;
        }

        if (!in_quad) continue;

        
        var forbidden_area1 = [
            [340,790],
            [336,890],
            [1390,785],
            [1391,889]
        ];
        var in_forbidden1 = false;
        {
            var a = forbidden_area1[0];
            var b = forbidden_area1[1];
            var c = forbidden_area1[2];
            var px = xx - a[0], py = yy - a[1];
            var v0x = c[0] - a[0], v0y = c[1] - a[1];
            var v1x = b[0] - a[0], v1y = b[1] - a[1];
            var dot00 = v0x*v0x + v0y*v0y;
            var dot01 = v0x*v1x + v0y*v1y;
            var dot02 = v0x*px   + v0y*py;
            var dot11 = v1x*v1x + v1y*v1y;
            var dot12 = v1x*px   + v1y*py;
            var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
            var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
            var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
            if ((u >= 0) && (v >= 0) && (u + v < 1)) in_forbidden1 = true;
        }
        if (!in_forbidden1)
        {
            var a = forbidden_area1[0];
            var c = forbidden_area1[2];
            var d = forbidden_area1[3];
            var px = xx - a[0], py = yy - a[1];
            var v0x = d[0] - a[0], v0y = d[1] - a[1];
            var v1x = c[0] - a[0], v1y = c[1] - a[1];
            var dot00 = v0x*v0x + v0y*v0y;
            var dot01 = v0x*v1x + v0y*v1y;
            var dot02 = v0x*px   + v0y*py;
            var dot11 = v1x*v1x + v1y*v1y;
            var dot12 = v1x*px   + v1y*py;
            var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
            var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
            var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
            if ((u >= 0) && (v >= 0) && (u + v < 1)) in_forbidden1 = true;
        }
        if (in_forbidden1) continue;

        
        var forbidden_area2 = [
            [399,1011],
            [402,1149],
            [1385,1147],
            [1383,1011]
        ];
        var in_forbidden2 = false;
        {
            var a = forbidden_area2[0];
            var b = forbidden_area2[1];
            var c = forbidden_area2[2];
            var px = xx - a[0], py = yy - a[1];
            var v0x = c[0] - a[0], v0y = c[1] - a[1];
            var v1x = b[0] - a[0], v1y = b[1] - a[1];
            var dot00 = v0x*v0x + v0y*v0y;
            var dot01 = v0x*v1x + v0y*v1y;
            var dot02 = v0x*px   + v0y*py;
            var dot11 = v1x*v1x + v1y*v1y;
            var dot12 = v1x*px   + v1y*py;
            var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
            var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
            var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
            if ((u >= 0) && (v >= 0) && (u + v < 1)) in_forbidden2 = true;
        }
        if (!in_forbidden2)
        {
            var a = forbidden_area2[0];
            var c = forbidden_area2[2];
            var d = forbidden_area2[3];
            var px = xx - a[0], py = yy - a[1];
            var v0x = d[0] - a[0], v0y = d[1] - a[1];
            var v1x = c[0] - a[0], v1y = c[1] - a[1];
            var dot00 = v0x*v0x + v0y*v0y;
            var dot01 = v0x*v1x + v0y*v1y;
            var dot02 = v0x*px   + v0y*py;
            var dot11 = v1x*v1x + v1y*v1y;
            var dot12 = v1x*px   + v1y*py;
            var invDenom = 1 / (dot00 * dot11 - dot01 * dot01);
            var u = (dot11 * dot02 - dot01 * dot12) * invDenom;
            var v = (dot00 * dot12 - dot01 * dot02) * invDenom;
            if ((u >= 0) && (v >= 0) && (u + v < 1)) in_forbidden2 = true;
        }
        if (in_forbidden2) continue;

        var p = instance_find(oPlayer,0);
        if (p != noone && point_distance(xx,yy,p.x,p.y) < 32) continue;

        if (scr_on_road(xx,yy) && !scr_solid_at(xx,yy)) break;
        if (tries > 1000) break;
    }

    global.delivery_target =
        instance_create_layer(xx,yy,"Instances",oDeliveryMarker);
}