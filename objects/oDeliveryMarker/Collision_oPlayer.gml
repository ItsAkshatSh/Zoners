global.score += 1;

// player just made a delivery; check for victory
if (global.score >= 10)
{
    // restart the room to reset state (Create will zero the score)
    room_restart();
    // no further code needed; the current marker will be destroyed
    return;
}

scr_generate_delivery();
instance_destroy();