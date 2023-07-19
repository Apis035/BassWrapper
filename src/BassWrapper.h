/*
 * BassWrapper 1.0
 * BASS 2.4.17.11
 */

#pragma once

/* BassWrapper Version */

#define VERSION_MAJOR 1
#define VERSION_MINOR 0
#define VERSION_RELEASE 0

/* Includes */

#include <Windows.h>

#define BASSDEF(f) (WINAPI * f)
#include "bass.h"

/* GM data type, DLL export */

typedef double number;
typedef const char *string;

#define dll __declspec(dllexport) __cdecl
#define function number dll

/* Globals */

HWND WindowHandle; // Game Maker window handle
HINSTANCE BassLibrary; // bass.dll handle

/* Prototypes */

// General
function bass_init(number windowHandle);
function bass_free();
function bass_close();
function bass_getcpu();
function bass_getversion();
function bass_getwrapperversion();
function bass_geterrorcode();

// Device
function bass_device_count();
function bass_device_get();
function bass_device_set(number device);
function bass_device_getvolume();
function bass_device_setvolume(number volume);
string dll bass_device_getname(number device);
function bass_device_getdsversion();
function bass_device_getlatency();
function bass_device_getspeakers();
function bass_device_getfrequency();
function bass_device_start();
function bass_device_isstarted();
function bass_device_stop();
function bass_device_pause();

// Sample
function bass_sample_load(string file, number max);
function bass_sample_free(number sample);
function bass_sample_play(number sample);
function bass_sample_stop(number sample);
function bass_sample_getglobalvolume();
function bass_sample_setglobalvolume(number volume);
function bass_sample_getvolume(number sample);
function bass_sample_setvolume(number sample, number volume);
function bass_sample_getpitch(number sample);
function bass_sample_setpitch(number sample, number pitch);
function bass_sample_getpan(number sample);
function bass_sample_setpan(number sample, number pan);

// Stream
function bass_stream_load(string file);
function bass_stream_free(number stream);
function bass_stream_play(number stream);
function bass_stream_stop(number stream);
function bass_stream_pause(number stream);
function bass_stream_resume(number stream);
function bass_stream_isplaying(number stream);
function bass_stream_ispaused(number stream);
function bass_stream_isstopped(number stream);
function bass_stream_getlength(number stream);
function bass_stream_getposition(number stream);
function bass_stream_setposition(number stream, number seconds);
function bass_stream_getloop(number stream);
function bass_stream_setloop(number stream, number loop);
function bass_stream_getloopstart(number stream);
function bass_stream_setloopstart(number stream, number seconds);
function bass_stream_getloopend(number stream);
function bass_stream_setloopend(number stream, number seconds);
function bass_stream_getglobalvolume();
function bass_stream_setglobalvolume(number volume);
function bass_stream_getvolume(number stream);
function bass_stream_setvolume(number stream, number volume);
function bass_stream_getpitch(number stream);
function bass_stream_setpitch(number stream, number pitch);
function bass_stream_getpan(number stream);
function bass_stream_setpan(number stream, number pan);
function bass_stream_slidevolume(number stream, number volume, number time);
function bass_stream_slidepitch(number stream, number pitch, number time);
function bass_stream_slidepan(number stream, number pan, number time);
function bass_stream_isvolumesliding(number stream);
function bass_stream_ispitchsliding(number stream);
function bass_stream_ispansliding(number stream);