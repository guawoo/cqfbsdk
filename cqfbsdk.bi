#pragma once
#Include Once "cqp.bi"
#Include Once "util.bi"

type GroupMemberInfo
   groupid as Longint = 0
   QQID as Longint = 0
   nick as String = ""
   card as String = ""
   sex as Long = 0
   age as Long = 0
   region as String = ""
   jointime as Long = 0
   lastspeaktime as Long = 0
   lvlname as String = ""
   adminsign as Long = 0
   specialname as String = ""
   specialnameexpiretime as Long = 0
   badsign as Long = 0
   modifycard as Long = 0
end type

Declare Sub endConvert_LongInt(Byref array As String)
Declare Sub endConvert_Short(Byref array As String)
Declare Sub endConvert_Long(Byref array As String)

Declare Function CQFB_getGroupMemberInfo( _
																AuthCode As Long, _
																groupid As Longint, _
																QQID As Longint, _
																nocache As CQBOOL _
																) As GroupMemberInfo Ptr