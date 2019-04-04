#Include Once "cqp.bi"
#Include Once "appmain.bi"
#Include Once "windows.bi"
#Include Once "log.bi"
#Include Once "crt/string.bi"
#Include Once "crt/stdio.bi"
#Include Once "config.bi"
#Include Once "cqfbsdk.bi"

#Define Unicode
#Define CONFIG_NAME "config.json"

Dim Shared ac As Long = -1
Dim Shared enable As Boolean = False
Dim Shared CQAPPINFO As String

Extern "Windows-MS"
   Public Function AppInfo Alias "AppInfo"() As Const Zstring Ptr Export
      
      CQAPPINFO = CQAPIVERTEXT + "," + CQAPPID
      Return Strptr(CQAPPINFO)
   End Function
   
   Function Initialize Alias "Initialize"(Byval AuthCode As Long) As Long Export
      ac = AuthCode
      Return 0
   End Function
   
   Function _eventStartup Alias "_eventStartup"() As Long Export
			
			Dim As Zstring Ptr path = strcat(CQ_getAppDirectory(ac), CONFIG_NAME)
			initConfigFile(path)
			
			Return 0
   End Function
   
   Function _eventExit Alias "_eventExit"() As Long Export
			Dim As Zstring Ptr path = strcat(CQ_getAppDirectory(ac), CONFIG_NAME)
			saveConfigFile(path)
			Return 0
   End Function

   Function _eventEnable Alias "_eventEnable"() As Long Export
      enable = true
      Return 0
   End Function

   Function _eventDisable Alias "_eventDisable"() As Long Export
			enable = False
			Return 0
   End Function
   
   Function _eventPrivateMsg Alias "_eventPrivateMsg"( _
																												Byval subType As Long, _
																												Byval msgId As Long, _
																												Byval fromQQ As Longint, _
																												Byval msg As Zstring Ptr, _
																												Byval font As Long _
																												) As Long Export
			

      Dim As DWSTRING src = "你好"
      
      Dim As String dest
      
      
      DWSTRINGToCQRawStr(src, dest)
			
			CQ_sendPrivateMsg(ac, fromQQ, dest)
			CQ_addLog(ac, CQLOG_DEBUG, "debug", dest)
      CQFB_Log(msg)
      CQFB_Log(dest)
			Return EVENT_IGNORE
	End Function
	
	Function _eventGroupMsg Alias "_eventGroupMsg"( _
																									Byval subType As Long, _
																									Byval msgId As Long, _
																									Byval fromGroup As Longint, _
																									Byval fromQQ As Longint, _
																									Byval fromAnonymous As Zstring Ptr, _
																									Byval msg As Zstring Ptr, _
																									Byval font As Long _
																									) As Long Export

			'Dim As Zstring Ptr rs = CQ_getGroupMemberInfoV2(ac, fromGroup, fromQQ, 1)
      Dim info As GroupMemberInfo Ptr => CQFB_getGroupMemberInfo(ac, fromGroup, fromQQ, 1)
      
      Var tmp = Str(info->groupid)
      CQ_addLog(ac,CQLOG_DEBUG,"groupid", Strptr(tmp))
      tmp = Str(info->QQID)
      CQ_addLog(ac,CQLOG_DEBUG,"QQID", Strptr(tmp))
      tmp = info->nick
      CQ_addLog(ac,CQLOG_DEBUG,"nick", Strptr(tmp))
      tmp = info->card
      CQ_addLog(ac,CQLOG_DEBUG,"card", Strptr(tmp))
      tmp = Str(info->sex)
      CQ_addLog(ac,CQLOG_DEBUG,"sex", Strptr(tmp))
      tmp = Str(info->age)
      CQ_addLog(ac,CQLOG_DEBUG,"age", Strptr(tmp))
      tmp = info->region
      CQ_addLog(ac,CQLOG_DEBUG,"region", Strptr(tmp))
      tmp = Str(info->jointime)
      CQ_addLog(ac,CQLOG_DEBUG,"jointime", Strptr(tmp))
      tmp = Str(info->lastspeaktime)
      CQ_addLog(ac,CQLOG_DEBUG,"lastspeaktime", Strptr(tmp))
      tmp = info->lvlname
      CQ_addLog(ac,CQLOG_DEBUG,"lvlname", Strptr(tmp))
      tmp = Str(info->adminsign)
      CQ_addLog(ac,CQLOG_DEBUG,"adminsign", Strptr(tmp))
      tmp = info->specialname
      CQ_addLog(ac,CQLOG_DEBUG,"specialname", Strptr(tmp))
      tmp = Str(info->specialnameexpiretime)
      CQ_addLog(ac,CQLOG_DEBUG,"specialnameexpiretime", Strptr(tmp))
      tmp = Str(info->badsign)
      CQ_addLog(ac,CQLOG_DEBUG,"badsign", Strptr(tmp))
      tmp = Str(info->modifycard)
      CQ_addLog(ac,CQLOG_DEBUG,"modifycard", Strptr(tmp))
      
      Delete info
			
			Return EVENT_IGNORE
	End Function
	
	Function _eventDiscussMsg Alias "_eventDiscussMsg"( _
																											Byval subType As Long, _
																											Byval msgId As Long, _
																											Byval fromDiscuss As Longint, _
																											Byval fromQQ As Longint, _
																											Byval msg As Const Zstring Ptr, _
																											Byval font As Long _
																											) As Long Export
		Return EVENT_IGNORE
	End Function
	
End Extern



