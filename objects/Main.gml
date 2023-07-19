#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bassInit()

/* Use this to change the output device
   0 - No sound
   1 - Default device
   2 - etc.
   3 - etc. */

//bassDeviceSet(69)

/* If you enable the line above and it fail to execute (which is trying setting the output
   device into a non-existing device), bassGetErrorCode() will return the error code.
   In this case it is error 23 (device not exist) */

error = bassGetErrorCode()

if error > 0
    show_message("[BASS] Error occured: " + string(error))

// Get version
version        = bassGetVersion()
versionMajor   = (version >> 24) & $ff
versionMinor   = (version >> 16) & $ff
versionRelease = (version >> 8)  & $ff
versionBuild   = (version)       & $ff

// Get wrapper version
wversion        = bassGetWrapperVersion()
wversionMajor   = (wversion >> 24) & $ff
wversionMinor   = (wversion >> 16) & $ff
wversionRelease = (wversion >> 8)  & $ff
wversionBuild   = (wversion)       & $ff

// Device information
device          = bassDeviceGet()
deviceTotal     = bassDeviceCount()
deviceName      = bassDeviceGetName(device)
deviceVolume    = bassDeviceGetVolume()
deviceDs        = bassDeviceGetDsVersion()
deviceLatency   = bassDeviceGetLatency()
deviceSpeaker   = bassDeviceGetSpeakers()
deviceFrequency = bassDeviceGetFrequency()

cpuUsage = 0

// Get device list
deviceList = 'Device list:#'

for (i=0; i<=deviceTotal; i+=1)
    deviceList += format(" - Device[$]: $#", i, bassDeviceGetName(i))

deviceList += '#'

// Update some information only on every second
alarm[0] = room_speed

// Load samples
sample[0] = bassSampleLoad("data\snare.wav", 0)
sample[1] = bassSampleLoad("data\kick.wav", 0)
sample[2] = bassSampleLoad("data\hihat.wav", 0)
sample[3] = bassSampleLoad("data\crash.wav", 0)

// Load streams
stream[0] = bassStreamLoad("data\amen-break_175bpm_D#_minor.ogg")
stream[1] = bassStreamLoad("data\electro-drums_132bpm.ogg")
stream[2] = bassStreamLoad("data\blue archive 1st anniversary bgm.ogg")
totalStream = 3
// You can add your own audio here. Don't forget to increase totalStream


// Custom loop for stream 3
bassStreamSetLoopStart(stream[2], 11.620)
bassStreamSetLoopEnd(stream[2], 86.146)

// Enable stream loop
i = 0 repeat totalStream {
    bassStreamSetLoop(stream[i], true)
    i += 1
}

// Which stream is currently selected
currentStream = 1

// No need to call those functions on each frame, update them only when necessary
currentStreamLength    = bassStreamGetLength(stream[currentStream])
currentStreamLoop      = bassStreamGetLoop(stream[currentStream])
currentStreamLoopStart = bassStreamGetLoopStart(stream[currentStream])
currentStreamLoopEnd   = bassStreamGetLoopEnd(stream[currentStream])
currentStreamVolume    = bassStreamGetVolume(stream[currentStream])
currentStreamPitch     = bassStreamGetPitch(stream[currentStream])
currentStreamPan       = bassStreamGetPan(stream[currentStream])

// Playback status (stopped | playing | paused)
status = 'stopped'

// Fancy background
bg = surface_create(room_width, room_height)
surface_set_target(bg)
    draw_set_color(c_gray)
    draw_rectangle(0, 0, room_width, room_height, false)
    i = 200 repeat 50 {
        draw_set_color(make_color(irandom(100), irandom(100), irandom(100)))
        draw_circle(irandom(room_width), irandom(room_height), i, false)
        i -= 3
    }
surface_reset_target()

/* Custom drawing control
   - Hitting sample button is more responsive
   - Less drawing, less gpu utilization
   - Logic is still updating on higher fps
   - You don't need high fps anyway

   Change room speed to change logic update speed.
   Change targetFps to change draw update speed. */

targetFps = 30
drawSpeed = room_speed / targetFps
drawTimer = 0

set_automatic_draw(false)
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
deviceVolume = bassDeviceGetVolume()
cpuUsage = bassGetCpu()
alarm[0] = room_speed
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Change stream
i = 0 repeat totalStream {
    if i != currentStream and keyboard_check_pressed(49 + i) {
        bassStreamStop(stream[currentStream])
        currentStream = i

        currentStreamLength    = bassStreamGetLength(stream[currentStream])
        currentStreamLoop      = bassStreamGetLoop(stream[currentStream])
        currentStreamLoopStart = bassStreamGetLoopStart(stream[currentStream])
        currentStreamLoopEnd   = bassStreamGetLoopEnd(stream[currentStream])
        currentStreamVolume    = bassStreamGetVolume(stream[currentStream])
        currentStreamPitch     = bassStreamGetPitch(stream[currentStream])
        currentStreamPan       = bassStreamGetPan(stream[currentStream])

        if status = 'playing' // continue playing
            bassStreamPlay(stream[currentStream])

        if status = 'paused' // reset playing
            status = 'stopped'

        break
    }
    i += 1
}

// Play, pause, resume
if keyboard_check_pressed(ord('P')) {
    switch status {

    case 'stopped':
        status = 'playing'
        bassStreamPlay(stream[currentStream])
        break

    case 'playing':
        status = 'paused'
        bassStreamPause(stream[currentStream])
        break

    case 'paused':
        status = 'playing'
        bassStreamResume(stream[currentStream])
        break

    }
}

// Stop
if keyboard_check_pressed(ord('S')) {
    status = 'stopped'
    bassStreamStop(stream[currentStream])
}

// Toggle loop
if keyboard_check_pressed(ord('L')) {
    currentStreamLoop = !currentStreamLoop
    bassStreamSetLoop(stream[currentStream], currentStreamLoop)
}

var value;

// Change volume
value = mouse_wheel_up() - mouse_wheel_down()
if value != 0 {
    bassStreamSetVolume(stream[currentStream], currentStreamVolume + value * 0.05)
    currentStreamVolume = bassStreamGetVolume(stream[currentStream])
}

// Change pitch
value = keyboard_check(vk_up) - keyboard_check(vk_down)
if value != 0 {
    bassStreamSetPitch(stream[currentStream], currentStreamPitch + value * 100)
    currentStreamPitch = bassStreamGetPitch(stream[currentStream])
}

// Change pan
value = keyboard_check(vk_right) - keyboard_check(vk_left)
if value != 0 {
    bassStreamSetPan(stream[currentStream], currentStreamPan + value * 0.02)
    currentStreamPan = bassStreamGetPan(stream[currentStream])
}

// Fade stream
if keyboard_check_pressed(ord('F')) {
    bassStreamSlideVolume(stream[currentStream], 0, 2000)
}

// Reset stream
if keyboard_check_pressed(ord('R')) {
    bassStreamSetVolume(stream[currentStream], 1)
    bassStreamSetPitch(stream[currentStream], 0)
    bassStreamSetPan(stream[currentStream], 0)

    currentStreamVolume = bassStreamGetVolume(stream[currentStream])
    currentStreamPitch  = bassStreamGetPitch(stream[currentStream])
    currentStreamPan    = bassStreamGetPan(stream[currentStream])
}

// Play sample
if keyboard_check_pressed(ord('Z'))
    bassSamplePlay(sample[0])
if keyboard_check_pressed(ord('X'))
    bassSamplePlay(sample[1])
if keyboard_check_pressed(ord('N'))
    bassSamplePlay(sample[2])
if keyboard_check_pressed(ord('M'))
    bassSamplePlay(sample[3])

// Custom drawing control
drawTimer += 1
if drawTimer = drawSpeed {
    drawTimer = 0
    screen_redraw()
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
bassClose()
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
// Background
draw_surface(bg, 0, 0)

draw_set_color(c_white)
draw_set_font(Bahnschrift)

// Top left
draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_text(16, 16, deviceList + format("
    Device used: $
    Device name: $
    Speaker count: $
    DirectSound version: $
    Output volume: $
    Output latency: $
    Output frequency: $
    CPU usage: $%",
    device,
    deviceName,
    deviceSpeaker,
    deviceDs,
    deviceVolume,
    deviceLatency,
    deviceFrequency,
    cpuUsage))

// Top right
draw_set_halign(fa_right)
draw_set_valign(fa_top)
draw_text(room_width - 16, 16, format("
    Selected stream $
    Stream is currently $
    Loop is $ (start/end: $/$)
    Volume: $%
    Pitch: $ Hz
    Pan: $
    Position: $/$ seconds",
    currentStream + 1,
    status,
    fi(currentStreamLoop, "enabled", "disabled"),
    currentStreamLoopStart, currentStreamLoopEnd,
    currentStreamVolume * 100,
    currentStreamPitch,
    currentStreamPan,
    string_format(bassStreamGetPosition(stream[currentStream]), 0, 1),
    floor(currentStreamLength)))

// Bottom left
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
draw_text(16, room_height - 16, format("
    BassWrapper v$.$
    BASS v$.$.$.$
    Logic FPS: $
    Draw FPS: $",
    wversionMajor, wversionMinor,
    versionMajor, versionMinor, versionRelease, versionBuild,
    fps,
    fps / drawSpeed))

// Bottom right
draw_set_halign(fa_right)
draw_set_valign(fa_bottom)
draw_text(room_width - 16, room_height - 16, "
    Control:
    1/2/3 - Change stream
    Z/X/N/M - Play sample
    P - Play/pause
    S - Stop
    L - Toggle loop
    Mouse wheel - Change volume
    Arrow keys - Change pitch/pan
    F - Fade volume
    R - Reset volume/pitch/pan")
