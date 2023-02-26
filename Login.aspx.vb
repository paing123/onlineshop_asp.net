Imports System.Data
Imports System.Data.SqlClient

Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        If tbUsername.Text <> "" Then
            Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString
            Dim connLogin As SqlConnection
            Dim cmdLogin As SqlCommand
            Dim drLogin As SqlDataReader
            Dim strSQL As String = "SELECT * FROM Customer WHERE Username = '" & Trim(tbUsername.Text) & "' AND Password = '" & Trim(tbPassword.Text) & "'"
            connLogin = New SqlConnection(strConn)
            cmdLogin = New SqlCommand(strSQL, connLogin)
            connLogin.Open()
            drLogin = cmdLogin.ExecuteReader(CommandBehavior.CloseConnection)
            If drLogin.Read() Then
                Session("Username") = tbUsername.Text
                Response.Redirect("Default")
            Else
                lblMessage.Text = "Login failed."
            End If
        End If
    End Sub
End Class