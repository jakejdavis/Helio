' ***********************************************************************
' Assembly         : Helio WPF
' Author           : Jake
' Created          : 08-15-2016
'
' Last Modified By : Jake
' Last Modified On : 08-17-2016
' ***********************************************************************
' <copyright file="Splash.xaml.vb" company="">
'     . All rights reserved.
' </copyright>
' <summary>
'     Shows splash screen at launch of program
' </summary>
' ***********************************************************************


Imports System.Web.Script.Serialization
Imports Helio.glbApp

Public Class Splash

    ' SUBS '

    Private Sub Start() Handles Me.Initialized
        Try
            Dim url = Global_Host
            Dim json As String = New Net.WebClient().DownloadString(url)
            Debug.WriteLine(json)
            Dim Store As Object = New JavaScriptSerializer().Deserialize(Of Object)(json)
            Debug.WriteLine(Store)
            If Store("response") = 200 Then
                Dim frmLogin = New Login()
                frmLogin.Show()
            End If
        Catch e As Exception
            MsgBox(e.Message)
        Finally
            Close()
        End Try
    End Sub


End Class
