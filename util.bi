#Pragma Once
#Include Once "windows.bi"
#Include Once "afx/DWSTRING.bi"

Declare Sub CQRawStrToDWSTRING(Byref src As String, Byref dest As DWSTRING)
Declare Sub DWSTRINGToCQRawStr(Byref src As DWSTRING, Byref dest As String)