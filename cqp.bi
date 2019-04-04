#Pragma Once

#Define CQAPIVER 9
#Define CQAPIVERTEXT "9"

Enum CQBOOL
	CQFALSE = 0
	CQTRUE = 1
End Enum

#Define EVENT_IGNORE 0         
#Define EVENT_BLOCK 1          

#Define REQUEST_ALLOW 1         
#Define REQUEST_DENY 2          

#Define REQUEST_GROUPADD 1      
#Define REQUEST_GROUPINVITE 2   

#Define CQLOG_DEBUG 0           
#Define CQLOG_INFO 10           
#Define CQLOG_INFOSUCCESS 11    
#Define CQLOG_INFORECV 12       
#Define CQLOG_INFOSEND 13       
#Define CQLOG_WARNING 20        
#Define CQLOG_ERROR 30          
#Define CQLOG_FATAL 40

#Inclib "CQP"
Declare Function CQ_addLog Stdcall Alias "CQ_addLog"( _
																										AuthCode As Long, _
																										priority As Long, _
																										category As Const Zstring Ptr, _
																										content As Const Zstring Ptr _
																										) As Long
																										
Declare Function CQ_sendPrivateMsg Stdcall Alias "CQ_sendPrivateMsg"( _
																																		AuthCode As Long, _
																																		QQID As Longint, _
																																		msg As Zstring Ptr _
																																		) As Long
																																		
Declare Function CQ_sendGroupMsg Stdcall Alias "CQ_sendGroupMsg"( _
																																AuthCode As Long, _
																																groupid As Longint, _
																																msg As Zstring Ptr _
																																) As Long

Declare Function CQ_sendDiscussMsg Stdcall Alias "CQ_sendDiscussMsg"( _
																																		AuthCode As Long, _
																																		discussid As Longint, _
																																		msg As Zstring Ptr _
																																		) As Long

Declare Function CQ_deleteMsg Stdcall Alias "CQ_deleteMsg"( _
																													AuthCode As Long, _
																													msgid As Longint _
																													) As Long
																													
Declare Function CQ_sendLike Stdcall Alias "CQ_sendLike"( _
																												AuthCode As Long, _
																												QQID As Longint _
																												) As Long
																											
Declare Function CQ_setGroupKick Stdcall Alias "CQ_setGroupKick"( _
																																AuthCode As Long, _
																																groupid As Longint, _
																																QQID As Longint, _
																																rejectaddrequest As CQBOOL _
																																) As Long
																																
Declare Function CQ_setGroupBan Stdcall Alias "CQ_setGroupBan"( _
																															AuthCode As Long, _
																															groupid As Longint, _
																															QQID As Longint, _
																															duration As Longint _
																															) As Long
																															
Declare Function CQ_setGroupAdmin Stdcall Alias "CQ_setGroupAdmin"( _
																																	AuthCode As Long, _
																																	groupid As Longint, _
																																	QQID As Longint, _
																																	setadmin As CQBOOL _
																																	) As Long
																															
Declare Function CQ_setGroupWholeBan Stdcall Alias "CQ_setGroupWholeBan"( _
																																				AuthCode As Long, _
																																				groupid As Longint, _
																																				enableban As CQBOOL _
																																				) As Long
																																				
Declare Function CQ_setGroupAnonymousBan Stdcall Alias "CQ_setGroupAnonymousBan"( _
																																								AuthCode As Long, _
																																								groupid As Longint, _
																																								anonymous As Zstring Ptr, _
																																								duration As Longint _
																																								) As Long
																															
Declare Function CQ_setGroupAnonymous Stdcall Alias "CQ_setGroupAnonymous"( _
																																					AuthoCode As Long, _
																																					groupid As Longint, _
																																					enableanonymous As CQBOOL _
																																					) As Long
																																					
Declare Function CQ_setGroupCard Stdcall Alias "CQ_setGroupCard"( _
																																AuthCode As Long, _
																																groupid As Longint, _
																																QQID As Longint, _
																																newcard As Zstring Ptr _
																																) As Long
																																
Declare Function CQ_setGroupLeave Stdcall Alias "CQ_setGroupLeave"( _
																																	AuthCode As Long, _
																																	groupid As Longint, _
																																	isdismiss As CQBOOL _
																																	) As Long
																																	
Declare Function CQ_setGroupSpecialTitle Stdcall Alias "CQ_setGroupSpecialTitle"( _
																																				AuthCode As Long, _
																																				groupid As Longint, _
																																				QQID As Longint, _
																																				newspecialtitle As Zstring Ptr, _
																																				duration As Longint _
																																				) As Long
																																		
Declare Function CQ_setDiscussLeave Stdcall Alias "CQ_setDiscussLeave"( _
																																			AuthCode As Long, _
																																			discussid As Longint _
																																			) As Long
																																			
Declare Function CQ_setFriendAddRequest Stdcall Alias "CQ_setFriendAddRequest"( _
																																							AuthCode As Long, _
																																							responseflag As Zstring Ptr, _
																																							responseoperation As Long, _
																																							remark As Zstring Ptr _
																																							) As Long
																																							
Declare Function CQ_setGroupAddRequestV2 Stdcall Alias "CQ_setGroupAddRequestV2"( _
																																								AuthCode As Long, _
																																								responseflag As Zstring Ptr, _
																																								requesttype As Long, _
																																								responseoperation As Long, _
																																								reason As Zstring Ptr _
																																								) As Long
																																			
Declare Function CQ_getGroupMemberInfoV2 Stdcall Alias "CQ_getGroupMemberInfoV2"( _
																																								AuthCode As Long, _
																																								groupid As Longint, _
																																								QQID As Longint, _
																																								nocache As CQBOOL _
																																								) As Zstring Ptr
																																		
Declare Function CQ_getStrangerInfo Stdcall Alias "CQ_getStrangerInfo"( _
																																			AuthCode As Long, _
																																			QQID As Longint, _
																																			nocache As CQBOOL _
																																			) As Zstring Ptr
																																			
Declare Function CQ_getCookies Stdcall Alias "CQ_getCookies"(AuthCode As Long) As Zstring Ptr
																														
Declare Function CQ_getCsrfToken Stdcall Alias "CQ_getCsrfToken"(AuthCode As Long) As Long

Declare Function CQ_getLoginQQ Stdcall Alias "CQ_getLoginQQ"(AuthCode As Long) As Longint

Declare Function CQ_getLoginNick Stdcall Alias "CQ_getLoginNick"(AuthCode As Long) As Zstring Ptr

Declare Function CQ_getAppDirectory Stdcall Alias "CQ_getAppDirectory"(AuthCode As Long) As Zstring Ptr

Declare Function CQ_setFatal Stdcall Alias "CQ_setFatal"(AuthCode As Long, errorinfo As Zstring Ptr) As Long

Declare Function CQ_getRecord Stdcall Alias "CQ_getRecord"( _
																													AuthCode As Long, _
																													file As Zstring Ptr, _
																													outformat As Zstring Ptr _
																													) As Zstring Ptr
																														