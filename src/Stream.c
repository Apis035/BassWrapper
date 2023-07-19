#include "BassWrapper.h"

function bass_stream_load(string file)
{ return BASS_StreamCreateFile(FALSE, file, 0, 0, 0); }

function bass_stream_free(number stream)
{ return BASS_StreamFree(stream); }

function bass_stream_play(number stream)
{ return BASS_ChannelPlay(stream, TRUE); }

function bass_stream_stop(number stream)
{ return BASS_ChannelStop(stream); }

function bass_stream_pause(number stream)
{ return BASS_ChannelPause(stream); }

function bass_stream_resume(number stream)
{ return BASS_ChannelPlay(stream, FALSE); }

function bass_stream_isplaying(number stream)
{ return BASS_ChannelIsActive(stream) == BASS_ACTIVE_PLAYING; }

function bass_stream_ispaused(number stream)
{ return BASS_ChannelIsActive(stream) == BASS_ACTIVE_PAUSED; }

function bass_stream_isstopped(number stream)
{ return BASS_ChannelIsActive(stream) == BASS_ACTIVE_STOPPED; }

function bass_stream_getlength(number stream)
{ return BASS_ChannelBytes2Seconds(stream, BASS_ChannelGetLength(stream, BASS_POS_BYTE)); }

function bass_stream_getposition(number stream)
{ return BASS_ChannelBytes2Seconds(stream, BASS_ChannelGetPosition(stream, BASS_POS_BYTE)); }

function bass_stream_setposition(number stream, number seconds)
{ return BASS_ChannelSetPosition(stream, BASS_ChannelSeconds2Bytes(stream, seconds), BASS_POS_BYTE); }

function bass_stream_getloop(number stream)
{ return BASS_ChannelFlags(stream, 0, 0) & BASS_SAMPLE_LOOP; }

function bass_stream_setloop(number stream, number loop)
{ return BASS_ChannelFlags(stream, loop ? BASS_SAMPLE_LOOP : 0, BASS_SAMPLE_LOOP); }

function bass_stream_getloopstart(number stream)
{ return BASS_ChannelBytes2Seconds(stream, BASS_ChannelGetPosition(stream, BASS_POS_LOOP)); }

function bass_stream_setloopstart(number stream, number seconds)
{ return BASS_ChannelSetPosition(stream, BASS_ChannelSeconds2Bytes(stream, seconds), BASS_POS_LOOP); }

function bass_stream_getloopend(number stream)
{ return BASS_ChannelBytes2Seconds(stream, BASS_ChannelGetPosition(stream, BASS_POS_END)); }

function bass_stream_setloopend(number stream, number seconds)
{ return BASS_ChannelSetPosition(stream, BASS_ChannelSeconds2Bytes(stream, seconds), BASS_POS_END); }

function bass_stream_getglobalvolume()
{ return BASS_GetConfig(BASS_CONFIG_GVOL_STREAM); }

function bass_stream_setglobalvolume(number volume)
{ return BASS_SetConfig(BASS_CONFIG_GVOL_STREAM, volume); }

function bass_stream_getvolume(number stream)
{
    float volume;
    BASS_ChannelGetAttribute(stream, BASS_ATTRIB_VOL, &volume);
    return volume;
}

function bass_stream_setvolume(number stream, number volume)
{ return BASS_ChannelSetAttribute(stream, BASS_ATTRIB_VOL, volume); }

function bass_stream_getpitch(number stream)
{
    float pitch;
    BASS_ChannelGetAttribute(stream, BASS_ATTRIB_FREQ, &pitch);
    return pitch;
}

function bass_stream_setpitch(number stream, number pitch)
{ return BASS_ChannelSetAttribute(stream, BASS_ATTRIB_FREQ, pitch); }

function bass_stream_getpan(number stream)
{
    float pan;
    BASS_ChannelGetAttribute(stream, BASS_ATTRIB_PAN, &pan);
    return pan;
}

function bass_stream_setpan(number stream, number pan)
{ return BASS_ChannelSetAttribute(stream, BASS_ATTRIB_PAN, pan); }

function bass_stream_slidevolume(number stream, number volume, number time)
{ return BASS_ChannelSlideAttribute(stream, BASS_ATTRIB_VOL, volume, time); }

function bass_stream_slidepitch(number stream, number pitch, number time)
{ return BASS_ChannelSlideAttribute(stream, BASS_ATTRIB_FREQ, pitch, time); }

function bass_stream_slidepan(number stream, number pan, number time)
{ return BASS_ChannelSlideAttribute(stream, BASS_ATTRIB_PAN, pan, time); }

function bass_stream_isvolumesliding(number stream)
{ return BASS_ChannelIsSliding(stream, BASS_ATTRIB_VOL); }

function bass_stream_ispitchsliding(number stream)
{ return BASS_ChannelIsSliding(stream, BASS_ATTRIB_FREQ); }

function bass_stream_ispansliding(number stream)
{ return BASS_ChannelIsSliding(stream, BASS_ATTRIB_PAN); }