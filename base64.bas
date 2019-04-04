#Pragma Once
dim shared as string B64
B64 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ" & _
      "abcdefghijklmnopqrstuvwxyz" & _
      "0123456789+/"

function E0(v1 as integer) as integer
  return v1 shr 2
end function
function E1(v1 as integer, _
            v2 as integer) as integer
  return ((v1 and 3) shl 4) + (v2 shr 4)
end function
function E2(v2 as integer, _
            v3 as integer) as integer
  return ((v2 and &H0F) shl 2) + (v3 shr 6)
end function
function E3(v3 as integer) as integer
  return (v3 and &H3F)
end function

Function MIMEDecode(s As String ) As Integer
  If Len(s) Then
    MIMEdecode = InStr( B64,s) - 1
  Else
    MIMEdecode = -1
  End If
End Function

' encoder by Joshy (D.J.Peters)
Function Encode64(S As String) As String
  dim as Integer j,k,l=len(S)
  dim as string  t
  if l=0 then return t

  t=string(((l+2)\3)*4,"=")
  For j = 0 To l - ((l Mod 3)+1) Step 3
    t[k+0]=B64[e0(S[j+0])]
    t[k+1]=B64[e1(S[j+0],S[j+1])]
    t[k+2]=B64[e2(S[j+1],S[j+2])]
    t[k+3]=B64[e3(S[j+2])]:k+=4
  Next
  If (l mod 3) = 2 Then
    t[k+0]=B64[e0(S[j+0])]
    t[k+1]=B64[e1(S[j+0],S[j+1])]
    t[k+2]=B64[e2(S[j+1],S[j+2])]
    t[k+3]=61
  ElseIf (l mod 3) = 1 Then
    t[k+0]=B64[e0(S[j+0])]
    t[k+1]=B64[e1(S[j+0],S[j+1])]
    t[k+2]=61
    t[k+3]=61
  End If
  return t
End Function

' decoder by Vince (vdecampo)
Function Decode64(s As String ) As String
  Dim As Integer w1, w2, w3, w4
  Dim As String  O
  For n As Integer = 1 To Len(s) Step 4
    w1 = MIMEdecode(Mid(s,n+0,1))
    w2 = MIMEdecode(Mid(s,n+1,1))
    w3 = MIMEdecode(Mid(s,n+2,1))
    w4 = MIMEdecode(Mid(s,n+3,1))
    If w2>-1 Then O+= Chr(((w1* 4 + Int(w2/16)) And 255))
    If w3>-1 Then O+= Chr(((w2*16 + Int(w3/ 4)) And 255))
    If w4>-1 Then O+= Chr(((w3*64 + w4        ) And 255))
  Next
  return O
End Function