Imports System.Data
Imports System.Data.SqlClient
Public Class ViewCart
    Inherits System.Web.UI.Page

    Public strCartNo As String = " "
    Dim CookieBack As HttpCookie = HttpContext.Current.Request.Cookies("CartNo")
    Public strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ' get CartNo
        If CookieBack IsNot Nothing Then
            strCartNo = CookieBack.Value
        End If
        sqlDSCart2.SelectCommand = "Select * From Cart Where CartNo = '" & strCartNo & "'"
        calculateTotalPrice()
    End Sub

    Protected Sub lvCart_OnItemCommand(ByVal sender As Object, ByVal e As ListViewCommandEventArgs)
        Dim connCart As SqlConnection
        Dim cmdCart As SqlCommand
        Dim drCart As SqlDataReader
        If e.CommandName = "cmdUpdate" Then
            ' get productno and quantity
            Dim strProductNo As String = e.CommandArgument
            Dim tbQuantity As TextBox = CType(e.Item.FindControl("tbQuantity"), TextBox)
            Dim strSQL As String = "Update Cart set Quantity = '" & CInt(tbQuantity.Text) & "' where ProductNo = '" & strProductNo & "' and CartNo = '" & strCartNo & "'"
            ' update
            connCart = New SqlConnection(strConn)
            cmdCart = New SqlCommand(strSQL, connCart)
            connCart.Open()
            drCart = cmdCart.ExecuteReader(CommandBehavior.CloseConnection)

        ElseIf e.CommandName = "cmdDelete" Then
            ' get productid and quantity
            Dim strProductID As String = e.CommandArgument
            Dim tbQuantity As TextBox = CType(e.Item.FindControl("tbQuantity"), TextBox)
            Dim strSQL As String = "Delete Cart where ProductNo = '" & strProductID & "' and CartNo = '" & strCartNo & "'"
            ' delete seleted item
            connCart = New SqlConnection(strConn)
            cmdCart = New SqlCommand(strSQL, connCart)
            connCart.Open()
            drCart = cmdCart.ExecuteReader(CommandBehavior.CloseConnection)

        End If
        calculateTotalPrice()
    End Sub

    'paging
    Protected Sub DataPagerId_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles DataPagerId.PreRender
        Dim total_pages As Integer
        Dim current_page As Integer
        lvCart.DataBind()
        total_pages = DataPagerId.TotalRowCount / DataPagerId.PageSize '5/3 = 2
        current_page = DataPagerId.StartRowIndex / DataPagerId.PageSize + 1 '1+1
        If DataPagerId.TotalRowCount Mod DataPagerId.PageSize <> 0 Then '5/3 = 2
            total_pages = total_pages + 1
        End If
        If CInt(lvCart.Items.Count) <> 0 Then
            'find control by using id, because it's inside the layouttemplate
            Dim lbl As Label = lvCart.FindControl("lblPage")
            lbl.Text = "Page " + CStr(current_page) + " of " + CStr(total_pages) + " (Total items: " + CStr(DataPagerId.TotalRowCount) + ")"
        End If
        'if cart doesn't have data, data pager, next, prev button are not show
        If CInt(lvCart.Items.Count) = 0 Then
            DataPagerId.Visible = False
            show_next.Visible = False
            show_prev.Visible = False
        End If
    End Sub

    Protected Sub show_prev_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_prev.Click
        Dim pagesize As Integer = DataPagerId.PageSize
        Dim current_page As Integer = DataPagerId.StartRowIndex / DataPagerId.PageSize + 1
        Dim total_pages As Integer = DataPagerId.TotalRowCount / DataPagerId.PageSize '10 / 3 = 4
        Dim last As Integer = total_pages \ 3 '1
        last = last * 3 '3
        Do While current_page < last '2 < 3
            last = last - 3
        Loop
        If last < 3 Then
            last = 0
        Else
            last = last - 3
        End If
        DataPagerId.SetPageProperties(last * pagesize, pagesize, True)
    End Sub

    Protected Sub show_next_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles show_next.Click
        Dim last As Integer = 3
        Dim pagesize As Integer = DataPagerId.PageSize
        Dim current_page As Integer = DataPagerId.StartRowIndex / DataPagerId.PageSize + 1
        Dim total_pages As Integer = DataPagerId.TotalRowCount / DataPagerId.PageSize
        Do While current_page > last
            last = last + 3
        Loop
        If last > total_pages Then
            last = total_pages
        End If
        DataPagerId.SetPageProperties(last * pagesize, pagesize, True)
    End Sub

    Private Sub calculateTotalPrice()
        Dim shippingFee As Decimal = 10.0
        Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString
        Dim strSQL As String = "SELECT * FROM Cart"
        Dim connProduct = New SqlConnection(strConn)
        Dim cmdProduct = New SqlCommand(strSQL, connProduct)
        connProduct.Open()
        Dim drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)

        Dim totalPrice As Decimal = 0.0 '800
        Dim unitPrice As Decimal = 0.0
        Dim quantity As Decimal = 0.0
        While drProduct.Read()
            If Session("Username") Is Nothing Then
                unitPrice = drProduct.Item("Price")
            Else
                unitPrice = drProduct.Item("Price") - (drProduct.Item("Price") * 0.2)
            End If

            quantity = drProduct.Item("Quantity")
            'add all subtotal price for total price
            totalPrice = totalPrice + (unitPrice * quantity)
        End While

        Dim lblCartTotal As Label = lvCart.FindControl("lblCartTotal")
        Dim lblGrandTotal As Label = lvCart.FindControl("lblGrandTotal")
        Dim lblShippingFee As Label = lvCart.FindControl("lblShippingFee")

        If totalPrice <> 0.0 Then
            If CookieBack IsNot Nothing Then
                lblCartTotal.Text = totalPrice
                lblGrandTotal.Text = totalPrice + shippingFee
                lblShippingFee.Text = shippingFee
            End If
        End If

    End Sub

    'delete all items in cart
    Protected Sub btnEmptyCart_Click(sender As Object, e As EventArgs)
        Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString
        Dim strSQL As String = "DELETE FROM Cart"
        Dim connProduct = New SqlConnection(strConn)
        Dim cmdProduct = New SqlCommand(strSQL, connProduct)
        connProduct.Open()
        cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
        HttpContext.Current.Request.Cookies("CartNo").Value = Nothing
    End Sub
End Class