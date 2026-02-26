if (!visible)
{
    return;
}

global.score += 1;


if (global.score >= 10)
{
    room_restart();
    return;
}

if (global.delivery_target != noone)
{
    global.delivery_target.visible = false;
}

if (array_length(global.marker_instances) > 0)
{
    
    if (ds_list_size(global.available_marker_indices) == 0)
    {
        for (var i = 0; i < array_length(global.marker_instances); ++i)
        {
            ds_list_add(global.available_marker_indices, i);
        }
    }

    
    var avail_count = ds_list_size(global.available_marker_indices);
    if (avail_count > 0)
    {
        var random_pos = irandom(avail_count - 1);
        global.current_marker_index = global.available_marker_indices[| random_pos];
        ds_list_delete(global.available_marker_indices, random_pos);
        global.delivery_target = global.marker_instances[global.current_marker_index];
        global.delivery_target.visible = true;
    }
}

instance_destroy();