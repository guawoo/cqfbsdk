#include Once "base64.bas"
#Include Once "cqfbsdk.bi"

'大小端互转
Sub endConvert_LongInt(Byref array As String)
	Swap array[0], array[7]
	Swap array[1], array[6]
	Swap array[2], array[5]
	Swap array[3], array[4]
End Sub

Sub endConvert_Short(Byref array As String)
	Swap array[0], array[1]
End Sub

Sub endConvert_Long(Byref array As String)
	Swap array[0], array[3]
	Swap array[1], array[2]
End Sub
'end 大小端互转

'返回值需要手动释放
Function CQFB_getGroupMemberInfo( _
																AuthCode As Long, _
																groupid As Longint, _
																QQID As Longint, _
																nocache As CQBOOL _
																) As GroupMemberInfo Ptr

	Dim As Zstring Ptr raw = CQ_getGroupMemberInfoV2(AuthCode, groupid, QQID, CQTRUE)
	
  
  
'  Dim As String code = Str(*raw)
  
'  Var llstr = Str(Len(code))
  
'  CQ_addLog(AuthCode, CQLOG_DEBUG, "debug", Strptr(code))
  
    Dim As String rawStr = Decode64(Str(*raw))
	
	Dim As GroupMemberInfo Ptr memberInfo = New GroupMemberInfo
	
    'groupid
	Var substr = Mid(rawStr, 1, 8)
	endConvert_LongInt(substr)
	memberInfo->groupid = *Cast(Longint ptr, Strptr(substr))
    
  
  
	'QQID
	substr = Mid(rawStr, 9, 8)
	endConvert_LongInt(substr)
    memberInfo->QQID = *Cast(Longint ptr, Strptr(substr))


    'nick
    substr = Mid(rawStr, 17,2)
    endConvert_Short(substr)
    Var l = *Cast(Short ptr, Strptr(substr))
    memberInfo->nick = Mid(rawStr, 19, l)
  
    'card
    Var idx = 19+l
    substr = Mid(rawStr, idx, 2)
    endConvert_Short(substr)
  
    idx += 2
  
    l = *Cast(Short Ptr, Strptr(substr))
    memberInfo->card = Mid(rawStr, idx, l)
  
    idx += l
  
    'sex
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->sex = *Cast(Long Ptr, Strptr(substr))
  
    idx +=4
  
    'age
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->age = *Cast(Long Ptr, Strptr(substr))
  
    idx+=4
  
    'region
    substr = Mid(rawStr, idx, 2)
    endConvert_Short(substr)
    l = *Cast(Short Ptr, Strptr(substr))
    idx += 2
  
    memberInfo->region = Mid(rawStr, idx, l)
    idx += l
  
    'jointime
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->jointime = *Cast(Long Ptr, Strptr(substr))
    idx+=4
  
    'lastspeaktime
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->lastspeaktime = *Cast(Long Ptr, Strptr(substr))
    idx+=4
  
    'lvlname
    substr = Mid(rawStr, idx, 2)
    endConvert_Short(substr)
    l = *Cast(Short Ptr, Strptr(substr))
    idx+=2
  
    memberInfo->lvlname = Mid(rawStr, idx, l)
    idx+=l
  
    'adminsign
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->adminsign = *Cast(Long Ptr, Strptr(substr))
    idx+=4
  
    'specialname
    substr = Mid(rawStr, idx, 2)
    endConvert_Short(substr)
    l = *Cast(Short Ptr, Strptr(substr))
    idx+=2
  
    memberInfo->specialname = Mid(rawStr, idx, l)
    idx+=l
  
    'specialnameexpiretime
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->specialnameexpiretime = *Cast(Long Ptr, Strptr(substr))
    idx+=4
  
    'badsign
    substr = Mid(rawStr, idx, 4)
    endConvert_Long(substr)
    memberInfo->badsign = *Cast(Long Ptr, Strptr(substr))
    idx+=4
  
    'modifycard
    substr = Mid(rawStr, idx ,4)
    endConvert_Long(substr)
    memberInfo->modifycard = *Cast(Long Ptr, Strptr(substr))
  
  
  
    Return memberInfo
  
End Function																
																
																
																
																
																