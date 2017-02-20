' ***********************************************************************
' Assembly         : Helio WPF
' Author           : Jake
' Created          : 07-31-2016
'
' Last Modified By : Jake
' Last Modified On : 08-18-2016
' ***********************************************************************
' <copyright file="Chat.xaml.vb" company="">
'     . All rights reserved.
' </copyright>
' <summary>
'     Chatting window
' </summary>
' ***********************************************************************


' IMPORTS '

Imports System.IO
Imports System.Net
Imports System.Threading
Imports Helio.glbApp


Public Class Chat

    ' DECLORATIONS '

    Public MessagesThread As New Thread(
        Sub()
            While True
                GetMessages()
                Wait(1)
            End While
        End Sub
    )
    Dim lastMessageId = 0

    ' FUNCTIONS '

    Private Function Wait(ByVal seconds As Integer)
        For i As Integer = 0 To seconds * 100
            Thread.Sleep(10)
            Forms.Application.DoEvents()
        Next
        Return True
    End Function

    ' SUBS '


    Private Sub SetError(status As String)
        imgStatus.Source = New BitmapImage(New Uri("imgBad.png", UriKind.Relative))
        textBox.Text = status
    End Sub


    Public Sub New()
        InitializeComponent()
        txtChannel.Text = Global_Channel
        lblVersion.Content = "b" + Global_Buildno
        GetMessages()
        MessagesThread.Start()
        ProfileInit()
    End Sub


    Private Sub ProfileInit()
        Dim wc As New WebClient()
        Dim url_avatar As String = "https://www.gravatar.com/avatar/" + Hash(Global_UserName) + "?d=retro&f=y&s=128"
        Dim bytes = wc.DownloadData(url_avatar)
        Dim ms = New MemoryStream(bytes)
        Dim img = New BitmapImage()
        ms.Seek(0, SeekOrigin.Begin)
        img.BeginInit()
        img.StreamSource = ms
        img.EndInit()
        imgProfilePicture.Source = img
        lblProfileUsername.Content = Global_UserName
    End Sub

    Private Sub CloseThreads() Handles Me.Closed
        MessagesThread.Abort()
    End Sub


    Private Sub GetMessages()
        Dim url As String = $"{Global_Host}/get_data?channel={Global_Channel}&username={Global_UserName}&token={Global_Token}"
        Dim output As String = ""
        Try
            Debug.WriteLine(url)
            Dim reply = DeJsFoUr(url)
            Dim tokenStatus = reply("token")
            Dim messages = reply("messages")
            Dim score = reply("score")
            If tokenStatus = "good" Then
                Dispatcher.Invoke(Sub()
                                      lblProfileScore.Content = $"Score: {score}"
                                      imgStatus.Source = New BitmapImage(New Uri("imgGood.png", UriKind.Relative))

                                  End Sub)
                For Each item In messages
                    Dispatcher.Invoke(Sub()
                                          If Integer.Parse(item("id")) > lastMessageId Then
                                              Dim message = New StackPanel()
                                              Dim messageContent = New StackPanel()
                                              Dim profilePicture = New Image()
                                              Dim author = New Label()
                                              author.Content = item("author")
                                              author.FontWeight = FontWeights.Bold
                                              author.FontSize = 16
                                              Dim text = New Label()
                                              text.Content = item("content")
                                              text.FontSize = 16
                                              message.Children.Add(profilePicture)
                                              message.Children.Add(messageContent)
                                              message.Orientation = Orientation.Horizontal
                                              message.HorizontalAlignment = HorizontalAlignment.Stretch
                                              messageContent.Children.Add(author)
                                              messageContent.Children.Add(text)
                                              messageContent.HorizontalAlignment = HorizontalAlignment.Stretch
                                              messageContent.Margin = New Thickness(7, 0, 0, 0)
                                              Dim wc As New WebClient()
                                              Dim url_avatar As String = "https://www.gravatar.com/avatar/" + Hash(item("author")) + "?d=retro&f=y&s=48"
                                              Dim bytes = wc.DownloadData(url_avatar)
                                              Dim ms = New MemoryStream(bytes)
                                              Dim img = New BitmapImage()
                                              ms.Seek(0, SeekOrigin.Begin)
                                              img.BeginInit()
                                              img.StreamSource = ms
                                              img.EndInit()
                                              profilePicture.Source = img
                                              profilePicture.Width = 48
                                              profilePicture.Height = 48
                                              profilePicture.HorizontalAlignment = HorizontalAlignment.Stretch
                                              pnlMessages.Children.Add(message)
                                              lastMessageId = item("id")
                                          End If
                                      End Sub)
                Next
            Else
                Dispatcher.Invoke(Sub() SetError("Bad Token!" + vbCrLf + "Someone else might have logged onto your account"))
            End If
        Catch e As Exception
            Dispatcher.Invoke(Sub() SetError("Error accessing the server: " + vbCrLf + e.Message))
        End Try
    End Sub


    Private Sub SendMessage() Handles btnSend.Click
        Dim url As String = Global_Host + "/snd_msg?content=" + txtMsg.Text + "&author=" + Global_UserName + "&channel=" + Global_Channel + "&token=" + Global_Token
        Try
            Dim response As String = New Net.WebClient().DownloadString(url)
            txtMsg.Text = ""
            GetMessages()
        Catch e As Exception
            Dispatcher.Invoke(Sub() SetError("Error sending message: " + vbCrLf + e.Message))
        End Try
    End Sub


    Private Sub EnterSendMessage(sender As Object, e As KeyEventArgs) Handles txtMsg.KeyDown
        If e.Key = Key.Return Then
            SendMessage()
        End If
    End Sub


    Private Sub ChangeChannel() Handles btnChannel.Click
        pnlMessages.Children.RemoveRange(0, 9999999)
        Global_Channel = txtChannel.Text
        GetMessages()
    End Sub

End Class
