#Include Once "log.bi"
#Include Once "windows.bi"
#Include Once "crt/string.bi"

Function CQFB_Log(content As Zstring Ptr) As Integer

	Dim fileHandle As HANDLE
	fileHandle = CreateFile("log.txt",GENERIC_WRITE, 0, NULL, OPEN_ALWAYS, FILE_ATTRIBUTE_NORMAL,NULL)
	If fileHandle <> INVALID_HANDLE_VALUE Then
		Dim As DWORD size
		Dim As DWORD fileSize

		fileSize = GetFileSize(fileHandle,NULl)
		SetFilePointer(fileHandle, 0, NULL, FILE_END)
		
		WriteFile(fileHandle, content,strlen(content), @size, NULL)
	End If
	FlushFileBuffers(fileHandle)
	CloseHandle(fileHandle)	
	Return 0
End Function