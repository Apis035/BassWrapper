#define bassInit
///bassInit()

/*
 * BassWrapper 1.0.1
 * BASS 2.4.17.11
 */

var dll, rl, str, _;
dll = "BassWrapper.dll"
rl  = ty_real
str = ty_string
_   = dll_cdecl

global._bass_dll                    = dll
global._bass_init                   = external_define(dll, "bass_init", _, rl, 1, rl)
global._bass_free                   = external_define(dll, "bass_free", _, rl, 0)
global._bass_close                  = external_define(dll, "bass_close", _, rl, 0)
global._bass_getcpu                 = external_define(dll, "bass_getcpu", _, rl, 0)
global._bass_getversion             = external_define(dll, "bass_getversion", _, rl, 0)
global._bass_getwrapperversion      = external_define(dll, "bass_getwrapperversion", _, rl, 0)
global._bass_geterrorcode           = external_define(dll, "bass_geterrorcode", _, rl, 0)
global._bass_device_count           = external_define(dll, "bass_device_count", _, rl, 0)
global._bass_device_get             = external_define(dll, "bass_device_get", _, rl, 0)
global._bass_device_set             = external_define(dll, "bass_device_set", _, rl, 1, rl)
global._bass_device_getvolume       = external_define(dll, "bass_device_getvolume", _, rl, 0)
global._bass_device_setvolume       = external_define(dll, "bass_device_setvolume", _, rl, 1, rl)
global._bass_device_getname         = external_define(dll, "bass_device_getname", _, str, 1, rl)
global._bass_device_getdsversion    = external_define(dll, "bass_device_getdsversion", _, rl, 0)
global._bass_device_getlatency      = external_define(dll, "bass_device_getlatency", _, rl, 0)
global._bass_device_getspeakers     = external_define(dll, "bass_device_getspeakers", _, rl, 0)
global._bass_device_getfrequency    = external_define(dll, "bass_device_getfrequency", _, rl, 0)
global._bass_device_start           = external_define(dll, "bass_device_start", _, rl, 0)
global._bass_device_isstarted       = external_define(dll, "bass_device_isstarted", _, rl, 0)
global._bass_device_stop            = external_define(dll, "bass_device_stop", _, rl, 0)
global._bass_device_pause           = external_define(dll, "bass_device_pause", _, rl, 0)
global._bass_sample_load            = external_define(dll, "bass_sample_load", _, rl, 2, str, rl)
global._bass_sample_free            = external_define(dll, "bass_sample_free", _, rl, 1, rl)
global._bass_sample_play            = external_define(dll, "bass_sample_play", _, rl, 1, rl)
global._bass_sample_stop            = external_define(dll, "bass_sample_stop", _, rl, 1, rl)
global._bass_sample_getglobalvolume = external_define(dll, "bass_sample_getglobalvolume", _, rl, 0)
global._bass_sample_setglobalvolume = external_define(dll, "bass_sample_setglobalvolume", _, rl, 1, rl)
global._bass_sample_getvolume       = external_define(dll, "bass_sample_getvolume", _, rl, 1, rl)
global._bass_sample_setvolume       = external_define(dll, "bass_sample_setvolume", _, rl, 2, rl, rl)
global._bass_sample_getpitch        = external_define(dll, "bass_sample_getpitch", _, rl, 1, rl)
global._bass_sample_setpitch        = external_define(dll, "bass_sample_setpitch", _, rl, 2, rl, rl)
global._bass_sample_getpan          = external_define(dll, "bass_sample_getpan", _, rl, 1, rl)
global._bass_sample_setpan          = external_define(dll, "bass_sample_setpan", _, rl, 2, rl, rl)
global._bass_stream_load            = external_define(dll, "bass_stream_load", _, rl, 1, str)
global._bass_stream_free            = external_define(dll, "bass_stream_free", _, rl, 1, rl)
global._bass_stream_play            = external_define(dll, "bass_stream_play", _, rl, 1, rl)
global._bass_stream_stop            = external_define(dll, "bass_stream_stop", _, rl, 1, rl)
global._bass_stream_pause           = external_define(dll, "bass_stream_pause", _, rl, 1, rl)
global._bass_stream_resume          = external_define(dll, "bass_stream_resume", _, rl, 1, rl)
global._bass_stream_isplaying       = external_define(dll, "bass_stream_isplaying", _, rl, 1, rl)
global._bass_stream_ispaused        = external_define(dll, "bass_stream_ispaused", _, rl, 1, rl)
global._bass_stream_isstopped       = external_define(dll, "bass_stream_isstopped", _, rl, 1, rl)
global._bass_stream_getlength       = external_define(dll, "bass_stream_getlength", _, rl, 1, rl)
global._bass_stream_getposition     = external_define(dll, "bass_stream_getposition", _, rl, 1, rl)
global._bass_stream_setposition     = external_define(dll, "bass_stream_setposition", _, rl, 2, rl, rl)
global._bass_stream_getloop         = external_define(dll, "bass_stream_getloop", _, rl, 1, rl)
global._bass_stream_setloop         = external_define(dll, "bass_stream_setloop", _, rl, 2, rl, rl)
global._bass_stream_getloopstart    = external_define(dll, "bass_stream_getloopstart", _, rl, 1, rl)
global._bass_stream_setloopstart    = external_define(dll, "bass_stream_setloopstart", _, rl, 2, rl, rl)
global._bass_stream_getloopend      = external_define(dll, "bass_stream_getloopend", _, rl, 1, rl)
global._bass_stream_setloopend      = external_define(dll, "bass_stream_setloopend", _, rl, 2, rl, rl)
global._bass_stream_getglobalvolume = external_define(dll, "bass_stream_getglobalvolume", _, rl, 0)
global._bass_stream_setglobalvolume = external_define(dll, "bass_stream_setglobalvolume", _, rl, 1, rl)
global._bass_stream_getvolume       = external_define(dll, "bass_stream_getvolume", _, rl, 1, rl)
global._bass_stream_setvolume       = external_define(dll, "bass_stream_setvolume", _, rl, 2, rl, rl)
global._bass_stream_getpitch        = external_define(dll, "bass_stream_getpitch", _, rl, 1, rl)
global._bass_stream_setpitch        = external_define(dll, "bass_stream_setpitch", _, rl, 2, rl, rl)
global._bass_stream_getpan          = external_define(dll, "bass_stream_getpan", _, rl, 1, rl)
global._bass_stream_setpan          = external_define(dll, "bass_stream_setpan", _, rl, 2, rl, rl)
global._bass_stream_slidevolume     = external_define(dll, "bass_stream_slidevolume", _, rl, 3, rl, rl, rl)
global._bass_stream_slidepitch      = external_define(dll, "bass_stream_slidepitch", _, rl, 3, rl, rl, rl)
global._bass_stream_slidepan        = external_define(dll, "bass_stream_slidepan", _, rl, 3, rl, rl, rl)
global._bass_stream_isvolumesliding = external_define(dll, "bass_stream_isvolumesliding", rl, 1, rl)
global._bass_stream_ispitchsliding  = external_define(dll, "bass_stream_ispitchsliding", rl, 1, rl)
global._bass_stream_ispansliding    = external_define(dll, "bass_stream_ispansliding", rl, 1, rl)

external_call(global._bass_init, window_handle())

#define bassFree
///bassFree()
return external_call(global._bass_free)

#define bassClose
///bassClose()
return external_call(global._bass_close) and external_free(global._bass_dll)

#define bassGetCpu
///bassGetCpu()
return external_call(global._bass_getcpu)

#define bassGetVersion
///bassGetVersion()
return external_call(global._bass_getversion)

#define bassGetWrapperVersion
///bassGetWrapperVersion
return external_call(global._bass_getwrapperversion)

#define bassGetErrorCode
///bassGetErrorCode()
return external_call(global._bass_geterrorcode)

#define bassDeviceCount
///bassDeviceCount()
return external_call(global._bass_device_count)

#define bassDeviceGet
///bassDeviceGet()
return external_call(global._bass_device_get)

#define bassDeviceSet
///bassDeviceSet(device)
return external_call(global._bass_device_set, argument0)

#define bassDeviceGetVolume
///bassDeviceGetVolume()
return external_call(global._bass_device_getvolume)

#define bassDeviceSetVolume
///bassDeviceSetVolume(volume)
return external_call(global._bass_device_setvolume, argument0)

#define bassDeviceGetName
///bassDeviceGetName(device)
return external_call(global._bass_device_getname, argument0)

#define bassDeviceGetDsVersion
///bassDeviceGetDsVersion()
return external_call(global._bass_device_getdsversion)

#define bassDeviceGetLatency
///bassDeviceGetLatency()
return external_call(global._bass_device_getlatency)

#define bassDeviceGetSpeakers
///bassDeviceGetSpeakers()
return external_call(global._bass_device_getspeakers)

#define bassDeviceGetFrequency
///bassDeviceGetFrequency()
return external_call(global._bass_device_getfrequency)

#define bassDeviceStart
///bassDeviceStart()
return external_call(global._bass_device_start)

#define bassDeviceIsStarted
///bassDeviceIsStarted()
return external_call(global._bass_device_isstarted)

#define bassDeviceStop
///bassDeviceStop()
return external_call(global._bass_device_stop)

#define bassDevicePause
///bassDevicePause()
return external_call(global._bass_device_pause)

#define bassSampleLoad
///bassSampleLoad(file, max)
return external_call(global._bass_sample_load, argument0, argument1)

#define bassSampleFree
///bassSampleFree(sample)
return external_call(global._bass_sample_free, argument0)

#define bassSamplePlay
///bassSamplePlay(sample)
return external_call(global._bass_sample_play, argument0)

#define bassSampleStop
///bassSampleStop(sample)
return external_call(global._bass_sample_stop, argument0)

#define bassSampleGetGlobalVolume
///bassSampleGetGlobalVolume()
return external_call(global._bass_sample_getglobalvolume)

#define bassSampleSetGlobalVolume
///bassSampleSetGlobalVolume(volume)
return external_call(global._bass_sample_setglobalvolume, argument0)

#define bassSampleGetVolume
///bassSampleGetVolume(sample)
return external_call(global._bass_sample_getvolume, argument0)

#define bassSampleSetVolume
///bassSampleSetVolume(sample, volume)
return external_call(global._bass_sample_setvolume, argument0, argument1)

#define bassSampleGetPitch
///bassSampleGetPitch(sample)
return external_call(global._bass_sample_getpitch, argument0)

#define bassSampleSetPitch
///bassSampleSetPitch(sample, pitch)
return external_call(global._bass_sample_setpitch, argument0, argument1)

#define bassSampleGetPan
///bassSampleGetPan(sample)
return external_call(global._bass_sample_getpan, argument0)

#define bassSampleSetPan
///bassSampleSetPan(sample, pan)
return external_call(global._bass_sample_setpan, argument0, argument1)

#define bassStreamLoad
///bassStreamLoad(file)
return external_call(global._bass_stream_load, argument0)

#define bassStreamFree
///bassStreamFree(stream)
return external_call(global._bass_stream_free, argument0)

#define bassStreamPlay
///bassStreamPlay(stream)
return external_call(global._bass_stream_play, argument0)

#define bassStreamStop
///bassStreamStop(stream)
return external_call(global._bass_stream_stop, argument0)

#define bassStreamPause
///bassStreamPause(stream)
return external_call(global._bass_stream_pause, argument0)

#define bassStreamResume
///bassStreamResume(stream)
return external_call(global._bass_stream_resume, argument0)

#define bassStreamIsPlaying
///bassStreamIsPlaying(stream)
return external_call(global._bass_stream_isplaying, argument0)

#define bassStreamIsPaused
///bassStreamIsPaused(stream)
return external_call(global._bass_stream_ispaused, argument0)

#define bassStreamIsStopped
///bassStreamIsStopped(stream)
return external_call(global._bass_stream_isstopped, argument0)

#define bassStreamGetLength
///bassStreamGetLength(stream)
return external_call(global._bass_stream_getlength, argument0)

#define bassStreamGetPosition
///bassStreamGetPosition(stream)
return external_call(global._bass_stream_getposition, argument0)

#define bassStreamSetPosition
///bassStreamSetPosition(stream, seconds)
return external_call(global._bass_stream_setposition, argument0, argument1)

#define bassStreamGetLoop
///bassStreamGetLoop(stream)
return external_call(global._bass_stream_getloop, argument0)

#define bassStreamSetLoop
///bassStreamSetLoop(stream, loop)
return external_call(global._bass_stream_setloop, argument0, argument1)

#define bassStreamGetLoopStart
///bassStreamGetLoopStart(stream)
return external_call(global._bass_stream_getloopstart, argument0)

#define bassStreamSetLoopStart
///bassStreamSetLoopStart(stream, seconds)
return external_call(global._bass_stream_setloopstart, argument0, argument1)

#define bassStreamGetLoopEnd
///bassStreamGetLoopEnd(stream)
return external_call(global._bass_stream_getloopend, argument0)

#define bassStreamSetLoopEnd
///bassStreamSetLoopEnd(stream, seconds)
return external_call(global._bass_stream_setloopend, argument0, argument1)

#define bassStreamGetGlobalVolume
///bassStreamGetGlobalVolume()
return external_call(global._bass_stream_getglobalvolume)

#define bassStreamSetGlobalVolume
///bassStreamSetGlobalVolume(volume)
return external_call(global._bass_stream_setglobalvolume, argument0)

#define bassStreamGetVolume
///bassStreamGetVolume(stream)
return external_call(global._bass_stream_getvolume, argument0)

#define bassStreamSetVolume
///bassStreamSetVolume(stream, volume)
return external_call(global._bass_stream_setvolume, argument0, argument1)

#define bassStreamGetPitch
///bassStreamGetPitch(stream)
return external_call(global._bass_stream_getpitch, argument0)

#define bassStreamSetPitch
///bassStreamSetPitch(stream, pitch)
return external_call(global._bass_stream_setpitch, argument0, argument1)

#define bassStreamGetPan
///bassStreamGetPan(stream)
return external_call(global._bass_stream_getpan, argument0)

#define bassStreamSetPan
///bassStreamSetPan(stream, pan)
return external_call(global._bass_stream_setpan, argument0, argument1)

#define bassStreamSlideVolume
///bassStreamSlideVolume(stream, volume, time)
return external_call(global._bass_stream_slidevolume, argument0, argument1, argument2)

#define bassStreamSlidePitch
///bassStreamSlidePitch(stream, pitch, time)
return external_call(global._bass_stream_slidepitch, argument0, argument1, argument2)

#define bassStreamSlidePan
///bassStreamSlidePan(stream, pan, time)
return external_call(global._bass_stream_slidepan, argument0, argument1, argument2)

#define bassStreamIsVolumeSliding
///bassStreamIsVolumeSliding(stream)
return external_call(global._bass_stream_isvolumesliding, argument0)

#define bassStreamIsPitchSliding
///bassStreamIsPitchSliding(stream)
return external_call(global._bass_stream_ispitchsliding, argument0)

#define bassStreamIsPanSliding
///bassStreamIsPanSliding(stream)
return external_call(global._bass_stream_ispansliding, argument0)
