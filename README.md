# BassWrapper

A Game Maker wrapper for [Un4seen](https://www.un4seen.com/)'s [BASS library](https://www.un4seen.com/bass.html).

This DLL allows Game Maker to use BASS to add support for various audio formats supported by BASS (WAV/AIFF/MP3/MP2/MP1/OGG) and use some of BASS functions such as seeking, looping, fading, etc. (more will be added)

BASS is free for non-commercial projects, otherwise you are required to have a license for commercial projects which can be obtained [here](http://www.un4seen.com/bass.html#license).

# Using

- Download _BassWrapper.zip_ from [releases](https://github.com/Apis035/BassWrapper/releases/latest) tab.
- Extract the files into a folder.
- Copy _BassWrapper.dll_ and _bass.dll_ into your project.
- Import _BassWrapper.gml_ script into your project.
- You can now start using BassWrapper.

See the included Game Maker example project for an overview on how to use BassWrapper functions.

# Compiling from source

- Have [Visual Studio](https://visualstudio.microsoft.com/) (IDE) or [Visual Studio Build Tools](https://aka.ms/vs/17/release/vs_BuildTools.exe) (smaller, no IDE) installed.
- Run `build.bat`.

# Others

This wrapper does not utilize every available BASS functions simply because some of them are not useful for Game Maker, too complex to be implemented (difference between C and GML), or are not implemented yet.

The other BASS wrapper that I know and which is this project is inspired from, [Sin Bass](https://web.archive.org/web/20110921141909/http://gmc.yoyogames.com/index.php?showtopic=460201), lacks some cool features such as seeking position by seconds, ability to set loop start and end position, ability to configure global stream/sample volume, which is the main reason I created this new wrapper.