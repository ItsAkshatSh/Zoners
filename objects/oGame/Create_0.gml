global.score = 0;
global.delivery_target = noone;
global.marker_instances = [
    inst_465D05E1,
    inst_794A2AAC,
    inst_575D0DCB,
    inst_10C6FFD4,
    inst_70C80B91,
    inst_6CF8F6EF,
    inst_3292CA48,
    inst_992C562,
    inst_2D0C1089,
    inst_7CDB2A4A,
    inst_6D0346AD
];

// Initialize available marker indices
global.available_marker_indices = ds_list_create();
for (var i = 0; i < array_length(global.marker_instances); ++i)
{
    ds_list_add(global.available_marker_indices, i);
}

// Hide all markers initially
for (var i = 0; i < array_length(global.marker_instances); ++i)
{
    global.marker_instances[i].visible = false;
}

// Show a random marker to start
var start_pos = irandom(ds_list_size(global.available_marker_indices) - 1);
var idx = global.available_marker_indices[| start_pos];
ds_list_delete(global.available_marker_indices, start_pos);
global.current_marker_index = idx;
global.delivery_target = global.marker_instances[global.current_marker_index];
global.delivery_target.visible = true;

// Reduce view size so camera follows the car
var cam = view_camera[0];
if (cam != noone)
{
    var vw = min(1024, room_width);
    var vh = min(768, room_height);
    camera_set_view_size(cam, vw, vh);
    camera_set_view_pos(cam, 0, 0);
}

scr_spawn_npc();