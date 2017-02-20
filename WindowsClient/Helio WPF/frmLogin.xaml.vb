' ***********************************************************************
' Assembly         : Helio WPF
' Author           : Jake
' Created          : 07-31-2016
'
' Last Modified By : Jake
' Last Modified On : 08-18-2016
' ***********************************************************************
' <copyright file="Login.xaml.vb" company="">
'     . All rights reserved.
' </copyright>
' <summary>
'     Login Window
' </summary>
' ***********************************************************************


' IMPORTS '

Imports Helio.glbApp

Public Class Login

    ' DECLORATIONS '

    Dim UsernamePlaceholderToggle = False
    Dim PasswordPlaceholderToggle = False
    Private sourceString As String


    ' SUBS '

    Private Sub setError(strError As String)
        If lblSuccess.Content IsNot "" Then
            lblSuccess.Content = ""
        End If
        lblError.Content = strError
    End Sub


    Private Sub setSuccess(strSuccess As String)
        If lblError.Content IsNot "" Then
            lblError.Content = ""
        End If
        lblSuccess.Content = strSuccess
    End Sub


    Private Sub btnLoginClick(sender As Object, e As RoutedEventArgs) Handles btnLogin.Click
        Dim url As String = Global_Host + "/login?username=" + txtUsername.Text + "&password=" + Hash(txtPassword.Text + txtUsername.Text)
        Try
            Dim reply = DeJsFoUr(url)
            Dim response = reply("response")
            If response = 200 Then
                Global_UserName = txtUsername.Text
                Global_Token = reply("token")
                Dim frmChat = New Chat()
                frmChat.Show()
                Close()
            ElseIf response = 500 Then
                setError("500 - Server Error")
            ElseIf response = 401 Then
                setError("401 - Username and password do not match")
            Else
                setError("408 - Could not connect to server")
            End If
        Catch err As Exception
            setError("408 - Could not connect to server")
        End Try

    End Sub


    Private Sub btnRegisterClick(sender As Object, e As RoutedEventArgs) Handles btnRegister.Click
        Dim url As String = Global_Host + "/register?username=" + txtUsername.Text + "&password=" + Hash(txtPassword.Text + txtUsername.Text)
        Dim reply = DeJsFoUr(url)
        Dim response = reply("response")
        If response = 200 Then
            setSuccess("200 - User created successfully")
        ElseIf response = 500 Then
            setError("500 - Failed to create user")
        ElseIf response = 409 Then
            setError("409 - Username already exists")
        Else
            setError("408 - Could not connect to server")
        End If
    End Sub


    Private Sub txtUsernameFocus() Handles txtUsername.GotFocus
        If UsernamePlaceholderToggle = False Then
            Dim UsernamePlaceholderToggle = True
            txtUsername.Text = ""
        End If
    End Sub


    Private Sub txtPasswordFocus() Handles txtPassword.GotFocus
        If PasswordPlaceholderToggle = False Then
            Dim PasswordPlaceholderToggle = True
            txtPassword.Text = ""
        End If
    End Sub

End Class
