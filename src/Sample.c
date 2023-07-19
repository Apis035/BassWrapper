#include "BassWrapper.h"

function bass_sample_load(string file, number max)
{ return BASS_SampleLoad(FALSE, file, 0, 0, max == 0 ? 65535 : max, 0); }

function bass_sample_free(number sample)
{ return BASS_SampleFree(sample); }

function bass_sample_play(number sample)
{ return BASS_ChannelPlay(BASS_SampleGetChannel(sample, 0), TRUE); }

function bass_sample_stop(number sample)
{ return BASS_ChannelStop(sample); }

function bass_sample_getglobalvolume()
{ return BASS_GetConfig(BASS_CONFIG_GVOL_SAMPLE); }

function bass_sample_setglobalvolume(number volume)
{ return BASS_SetConfig(BASS_CONFIG_GVOL_SAMPLE, volume); }

function bass_sample_getvolume(number sample)
{
    BASS_SAMPLE info;
    BASS_SampleGetInfo(sample, &info);
    return info.volume;
}

function bass_sample_setvolume(number sample, number volume)
{
    BASS_SAMPLE info;
    BASS_SampleGetInfo(sample, &info);
    info.volume = volume;
    return BASS_SampleSetInfo(sample, &info);
}

function bass_sample_getpitch(number sample)
{
    BASS_SAMPLE info;
    BASS_SampleGetInfo(sample, &info);
    return info.freq;
}

function bass_sample_setpitch(number sample, number pitch)
{
    BASS_SAMPLE info;
    BASS_SampleGetInfo(sample, &info);
    info.freq = pitch;
    return BASS_SampleSetInfo(sample, &info);
}

function bass_sample_getpan(number sample)
{
    BASS_SAMPLE info;
    BASS_SampleGetInfo(sample, &info);
    return info.pan;
}

function bass_sample_setpan(number sample, number pan)
{
    BASS_SAMPLE info;
    BASS_SampleGetInfo(sample, &info);
    info.pan = pan;
    return BASS_SampleSetInfo(sample, &info);
}