' ***********************************************************************
' Assembly         : Helio WPF
' Author           : Jake
' Created          : 08-02-2016
'
' Last Modified By : Jake
' Last Modified On : 08-17-2016
' ***********************************************************************
' <copyright file="Globals.vb" company="">
'     . All rights reserved.
' </copyright>
' <summary>
'     Declares some Global variables For other classes to access
' </summary>
' ***********************************************************************

Imports System.Web.Script.Serialization

Public Class glbApp
    Public Shared Global_UserName As String = ""
    Public Shared Global_Token As String = ""
    Public Shared Global_Host As String = "https://helio-server.herokuapp.com/"
    Public Shared Global_Channel As String = "welcome"
    Public Shared Global_Buildno As String = "090916"

    ' FUNCTIONS '

    Public Shared Function Hash(strToHash As String)
        Dim sha1Obj As New Security.Cryptography.SHA1CryptoServiceProvider
        Dim bytesToHash() As Byte = Text.Encoding.ASCII.GetBytes(strToHash)
        bytesToHash = sha1Obj.ComputeHash(bytesToHash)
        Dim strResult As String = ""
        For Each b As Byte In bytesToHash
            strResult += b.ToString("x2")
        Next
        Return strResult
    End Function


    Public Shared Function DecodeJson(json)
        Dim Store As Object = New JavaScriptSerializer().Deserialize(Of Object)(json)
        Return Store
    End Function


    Public Shared Function DeJsFoUr(url As String)
        Dim json As String = New Net.WebClient().DownloadString(url)
        Debug.WriteLine(json)
        Dim Store As Object = New JavaScriptSerializer().Deserialize(Of Object)(json)
        Debug.WriteLine(Store)
        Return Store
    End Function
End Class
