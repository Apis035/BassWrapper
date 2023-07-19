@call "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build\vcvars32.bat"
@cl /nologo /LD /MD /O2 src\*.c /Fe:BassWrapper.dll
@del *.exp *.lib *.obj
@pause