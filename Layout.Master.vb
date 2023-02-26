Imports System.Data
Imports System.Data.SqlClient

Public Class Layout
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' determine if the customer is logged in
        If Session("Username") <> "" Then
            hlLogin.Visible = False
            hlLogout.Visible = True
            hrefCustomer.InnerText = Session("Username")
        Else
            hlLogin.Visible = True
            hlLogout.Visible = False
            hrefCustomer.InnerText = ""
        End If
    End Sub

    Private Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        If tbSearchString.Text <> "" Then
            Dim strCheck As String = " "
            Dim strSearch = Trim(tbSearchString.Text)
            If strSearch <> "" Then ' check if the string is not empty
                Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString
                Dim connProductSearch As SqlConnection
                Dim cmdProductSearch As SqlCommand
                Dim drProductSearch As SqlDataReader
                Dim strSQL As String = "SELECT * FROM Product WHERE ProductNo = '" & Trim(tbSearchString.Text) & "'"
                connProductSearch = New SqlConnection(strConn)
                cmdProductSearch = New SqlCommand(strSQL, connProductSearch)
                connProductSearch.Open()
                drProductSearch = cmdProductSearch.ExecuteReader(CommandBehavior.CloseConnection)
                Dim strURL As String
                If drProductSearch.Read() Then
                    strURL = "ProductDetail.aspx?ProductNo=" + strSearch
                    Response.Redirect(strURL)
                Else
                    strURL = "Category.aspx?SearchString=" + strSearch
                    Response.Redirect(strURL)
                End If
            End If
        End If
    End Sub
End Class