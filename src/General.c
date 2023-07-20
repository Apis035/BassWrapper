#include "BassWrapper.h"

/* Disable FARPROC warning in GetProcAddress */
#pragma warning(disable : 4113)
#pragma warning(disable : 4133)

function bass_init(number window_handle)
{
    WindowHandle = (HWND)(int)window_handle;
    BassLibrary = LoadLibrary("bass.dll");

    if (BassLibrary == NULL)
    {
        return -1;
    }

#define Load(f) f = GetProcAddress(BassLibrary, #f)

#pragma region "Initialization, info, etc..."
    Load(BASS_ErrorGetCode);
    Load(BASS_Free);
    Load(BASS_GetCPU);
    Load(BASS_GetDevice);
    Load(BASS_GetDeviceInfo);
    Load(BASS_GetInfo);
    Load(BASS_GetVersion);
    Load(BASS_GetVolume);
    Load(BASS_Init);
    Load(BASS_IsStarted);
    Load(BASS_Pause);
    Load(BASS_SetDevice);
    Load(BASS_SetVolume);
    Load(BASS_Start);
    Load(BASS_Stop);
    // Load(BASS_Update);
#pragma endregion

#pragma region "3D"
    // Load(BASS_Apply3D);
    // Load(BASS_Get3DFactors);
    // Load(BASS_Get3DPosition);
    // Load(BASS_Set3DFactors);
    // Load(BASS_Set3DPosition);
#pragma endregion

#pragma region "Samples"
    // Load(BASS_SampleCreate);
    Load(BASS_SampleFree);
    Load(BASS_SampleGetChannel);
    // Load(BASS_SampleGetChannels);
    // Load(BASS_SampleGetData);
    Load(BASS_SampleGetInfo);
    Load(BASS_SampleLoad);
    // Load(BASS_SampleSetData);
    Load(BASS_SampleSetInfo);
    Load(BASS_SampleStop);
#pragma endregion

#pragma region "Streams"
    // Load(BASS_StreamCreate);
    Load(BASS_StreamCreateFile);
    // Load(BASS_StreamCreateFileUser);
    // Load(BASS_StreamCreateURL);
    Load(BASS_StreamFree);
    // Load(BASS_StreamGetFilePosition);
    // Load(BASS_StreamPutData);
    // Load(BASS_StreamPutFileData);
#pragma endregion

#pragma region "MOD/MO3 music"
    // Load(BASS_MusicFree);
    // Load(BASS_MusicLoad);
#pragma endregion

#pragma region "Recording"
    // Load(BASS_RecordFree);
    // Load(BASS_RecordGetDevice);
    // Load(BASS_RecordGetDeviceInfo);
    // Load(BASS_RecordGetInfo);
    // Load(BASS_RecordGetInput);
    // Load(BASS_RecordGetInputName);
    // Load(BASS_RecordInit);
    // Load(BASS_RecordSetDevice);
    // Load(BASS_RecordSetInput);
    // Load(BASS_RecordStart);
#pragma endregion

#pragma region "Channels"
    Load(BASS_ChannelBytes2Seconds);
    Load(BASS_ChannelFlags);
    // Load(BASS_ChannelFree);
    // Load(BASS_ChannelGet3DAttributes);
    // Load(BASS_ChannelGet3DPosition);
    Load(BASS_ChannelGetAttribute);
    // Load(BASS_ChannelGetAttributeEx);
    // Load(BASS_ChannelGetData);
    // Load(BASS_ChannelGetDevice);
    // Load(BASS_ChannelGetInfo);
    Load(BASS_ChannelGetLength);
    // Load(BASS_ChannelGetLevel);
    // Load(BASS_ChannelGetLevelEx);
    Load(BASS_ChannelGetPosition);
    // Load(BASS_ChannelGetTags);
    Load(BASS_ChannelIsActive);
    Load(BASS_ChannelIsSliding);
    // Load(BASS_ChannelLock);
    Load(BASS_ChannelPause);
    Load(BASS_ChannelPlay);
    // Load(BASS_ChannelRemoveDSP);
    // Load(BASS_ChannelRemoveFX);
    // Load(BASS_ChannelRemoveLink);
    // Load(BASS_ChannelRemoveSync);
    Load(BASS_ChannelSeconds2Bytes);
    // Load(BASS_ChannelSet3DAttributes);
    // Load(BASS_ChannelSet3DPosition);
    Load(BASS_ChannelSetAttribute);
    // Load(BASS_ChannelSetAttributeEx);
    // Load(BASS_ChannelSetDevice);
    // Load(BASS_ChannelSetDSP);
    // Load(BASS_ChannelSetFX);
    // Load(BASS_ChannelSetLink);
    Load(BASS_ChannelSetPosition);
    // Load(BASS_ChannelSetSync);
    Load(BASS_ChannelSlideAttribute);
    Load(BASS_ChannelStart);
    Load(BASS_ChannelStop);
    // Load(BASS_ChannelUpdate);
#pragma endregion

#pragma region "Effects"
    // Load(BASS_FXGetParameters);
    // Load(BASS_FXReset);
    // Load(BASS_FXSetParameters);
    // Load(BASS_FXSetPriority);
#pragma endregion

#undef Load

    return BASS_Init(-1, 44100, 0, WindowHandle, NULL);
}

function bass_free()
{ return BASS_Free(); }

function bass_close()
{ return FreeLibrary(BassLibrary); }

function bass_getcpu()
{ return BASS_GetCPU(); }

function bass_getversion()
{ return BASS_GetVersion(); }

function bass_getwrapperversion()
{ return VERSION_MAJOR << 24 | VERSION_MINOR << 16 | VERSION_RELEASE << 8; }

function bass_geterrorcode()
{ return BASS_ErrorGetCode(); }