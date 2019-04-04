#Include Once "util.bi"

Enum Encoding
  GB18030 = 54936
  UTF16 = 1200
End Enum

Sub CQRawStrToDWSTRING(Byref src As String, Byref dest As DWSTRING)
    Var lenlen = MultiByteToWideChar(GB18030, 0, Strptr(src), Len(src), NULL, 0)
    Dim As Wstring Ptr wsp = Callocate(lenlen+1)
    MultiByteToWideChar(GB18030, 0, Strptr(src), -1, wsp, lenlen)
    
    dest = wsp
    
    Deallocate(wsp)
    
End Sub

Sub DWSTRINGToCQRawStr(Byref src As DWSTRING, Byref dest As String)
  Var lenlen = WideCharToMultiByte(GB18030, 0, src.vptr, -1, NULL, 0, NULL, NULL)
  Dim As Zstring Ptr zsp = Callocate(lenlen+1)
  WideCharToMultiByte(GB18030, 0, src.vptr, lenlen, zsp, lenlen, NULL, NULL)
  
  dest = Str(*zsp)
  Deallocate(zsp)
End Sub