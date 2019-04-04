#Include Once "log.bi"
#Include Once "crt/stdio.bi"
#Include Once "fbJson.bi"
#Include Once "config.bi"

Dim Shared configContent As Zstring * 255
Dim Shared configObj As JsonItem

Sub initConfigFile(Byref path As Zstring Ptr)
	Dim fh As FILE Ptr
	
	fh = fopen(path, "w+")
	If fh = 0 Then
		CQFB_Log(!"open config file error.\r\n")
		Return
	End If
	
	fgets(@configContent, 255, fh)
	If Len(configContent) > 0 Then
		configObj.Parse(Str(configContent))
		fclose(fh)
		Return
	End If
	
	configObj.Parse("{""broadcastGroups"":[]}")
	Dim As String configjsonstr
	configjsonstr = configObj.ToString()

	fputs(Strptr(configjsonstr), fh)
	fclose(fh)
	
End Sub

Sub addGroupToBroadcast(groupid As Longint)
	configObj["broadcastGroups"].AddItem(Str(groupid))
End Sub

Sub saveConfigFile(Byref path As Zstring Ptr)
	Dim As FILE Ptr fh
	fh = fopen(path, "w+")
	If fh = 0 Then
		CQFB_Log(!"save config file error.\r\n")
		fclose(fh)
		Return
	End If
	
	Dim As String jsonstr = configObj.ToString
	fputs(Strptr(jsonstr), fh)
	fclose(fh)
	
End Sub

















