#include "BassWrapper.h"

function bass_device_count()
{
    int i, count = 0;
    BASS_DEVICEINFO info;
    for (i = 1; BASS_GetDeviceInfo(i, &info); i++)
    {
        if (info.flags & BASS_DEVICE_ENABLED)
        {
            count++;
        }
    }
    return count;
}

function bass_device_get()
{ return BASS_GetDevice(); }

function bass_device_set(number device)
{
    if (!BASS_SetDevice(device))
    {
        BASS_Init(device, 44100, 0, WindowHandle, NULL);
    }
    return BASS_SetDevice(device);
}

function bass_device_getvolume()
{ return BASS_GetVolume(); }

function bass_device_setvolume(number volume)
{ return BASS_SetVolume(volume); }

string dll bass_device_getname(number device)
{
    BASS_DEVICEINFO info;
    BASS_GetDeviceInfo(device, &info);
    return info.name;
}

function bass_device_getdsversion()
{
    BASS_INFO info;
    BASS_GetInfo(&info);
    return info.dsver;
}

function bass_device_getlatency()
{
    BASS_INFO info;
    BASS_GetInfo(&info);
    return info.latency;
}

function bass_device_getspeakers()
{
    BASS_INFO info;
    BASS_GetInfo(&info);
    return info.speakers;
}

function bass_device_getfrequency()
{
    BASS_INFO info;
    BASS_GetInfo(&info);
    return info.freq;
}

function bass_device_start()
{ return BASS_Start(); }

function bass_device_isstarted()
{ return BASS_IsStarted(); }

function bass_device_stop()
{ return BASS_Stop(); }

function bass_device_pause()
{ return BASS_Pause(); }