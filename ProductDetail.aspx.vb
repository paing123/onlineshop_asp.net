Imports System.Data
Imports System.Data.SqlClient

Public Class ProductDetail
    Inherits System.Web.UI.Page

    Public rating As Integer = 1
    Private productPrice As Integer = 0


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim strConn As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString
        Dim connProduct As SqlConnection
        Dim cmdProduct As SqlCommand
        Dim drProduct As SqlDataReader

        ' from category.aspx
        If Request.QueryString("ProductNo") <> "" Then
            Dim strSQL As String = "SELECT * FROM Product WHERE ProductNo = '" & Request.QueryString("ProductNo") & "'"
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            If drProduct.Read() Then
                lblProductName.Text = drProduct.Item("ProductName")
                lblProductNo.Text = drProduct.Item("ProductNo")
                productPrice = drProduct.Item("Price")
                lblProductDescription.Text = drProduct.Item("ProductDescription")
                productImage.ImageUrl = "images/" & Trim(drProduct.Item("ProductNo")) & ".jpg"
                productImage.AlternateText = drProduct.Item("ProductName")
                rating = drProduct.Item("Rating")
                chcekDiscountPrice()

                'for meta data <title>text text</title>
                dynamicTitle.InnerHtml = drProduct.Item("ProductName")
                ' trim only when not empty
                If Not IsDBNull(drProduct.Item("ProductKeyword")) Then
                    metaKeywords.Attributes.Item("content") = Trim(drProduct.Item("ProductKeyword"))
                End If
                If Not IsDBNull(drProduct.Item("ProductDescription")) Then
                    metaDescription.Attributes.Item("content") = Trim(drProduct.Item("ProductDescription"))
                End If
            End If
            ' from search data
        ElseIf Request.QueryString("ProductNo") <> "" Then
            Dim strSQL As String = "SELECT * FROM Product WHERE ProductNo = '" & Request.QueryString("ProductNo") & "'"
            connProduct = New SqlConnection(strConn)
            cmdProduct = New SqlCommand(strSQL, connProduct)
            connProduct.Open()
            Response.Write("product search by product no.")
            drProduct = cmdProduct.ExecuteReader(CommandBehavior.CloseConnection)
            If drProduct.Read() Then
                lblProductName.Text = drProduct.Item("ProductName")
                lblProductNo.Text = drProduct.Item("ProductNo")
                lblPrice.Text = drProduct.Item("Price")
                lblProductDescription.Text = drProduct.Item("ProductDescription")
                productImage.ImageUrl = "images/" & Trim(drProduct.Item("ProductNo")) & ".jpg"
                rating = drProduct.Item("Rating")

                'for meta data
                dynamicTitle.InnerHtml = drProduct.Item("ProductName")
                ' trim only when not empty
                If Not IsDBNull(drProduct.Item("ProductKeyword")) Then
                    metaKeywords.Attributes.Item("content") = Trim(drProduct.Item("ProductKeyword"))
                End If
                If Not IsDBNull(drProduct.Item("ProductDescription")) Then
                    metaDescription.Attributes.Item("content") = Trim(drProduct.Item("ProductDescription"))
                End If
            End If
        End If
    End Sub

    Private Sub chcekDiscountPrice()
        If Session("Username") Is Nothing Then
            lblPrice.Text = productPrice
        Else
            lblPrice.Text = productPrice - (productPrice * 0.2) & " (20% OFF)"
        End If
    End Sub

    Private Sub btnAddtoCart_Click(sender As Object, e As EventArgs) Handles btnAddtoCart.Click
        'get CartNo
        Dim strCartNo As String
        If HttpContext.Current.Request.Cookies("CartNo") Is Nothing Then
            strCartNo = GetRandomCartNoUsingGUID(10)
            Dim CookieTo As New HttpCookie("CartNo", strCartNo)
            HttpContext.Current.Response.AppendCookie(CookieTo)
        Else
            Dim CookieBack As HttpCookie
            CookieBack = HttpContext.Current.Request.Cookies("CartNo")
            strCartNo = CookieBack.Value
        End If
        ' set up ado objects and variables
        Dim strConnectionString As String = System.Configuration.ConfigurationManager.ConnectionStrings("OnlineShopConnectionString").ConnectionString
        Dim conn As New SqlConnection(strConnectionString)
        Dim drCheck As SqlDataReader
        Dim strSQLStatement As String
        Dim cmdSQL As SqlCommand
        ' get product price
        strSQLStatement = "Select * From Product Where ProductNo = '" & lblProductNo.Text & "'"
        cmdSQL = New SqlCommand(strSQLStatement, conn)
        conn.Open()
        drCheck = cmdSQL.ExecuteReader()
        Dim decPrice As Decimal
        If drCheck.Read() Then
            decPrice = drCheck.Item("Price")
        End If
        drCheck.Close()
        ' check if this product already exits in the cart
        strSQLStatement = "SELECT * FROM Cart WHERE CartNo = '" & strCartNo & "' and ProductNo = '" & Trim(lblProductNo.Text) & "'"
        cmdSQL.CommandText = strSQLStatement
        drCheck = cmdSQL.ExecuteReader()
        If drCheck.Read() Then
            'if item that add to cart is already exist, update the final quantity
            Dim currentQty As Integer = drCheck.Item("Quantity")
            Dim updateQty As Integer = currentQty + CInt(tbQuantity.Text)
            strSQLStatement = "UPDATE Cart SET Quantity=" & updateQty & " WHERE ProductNo = '" & Trim(lblProductNo.Text) & "'"
        Else
            strSQLStatement = "INSERT INTO Cart (CartNo, ProductNo, ProductName, Quantity, Price) values('" & strCartNo & "', '" & lblProductNo.Text & "', '" & lblProductName.Text & "', " & CInt(tbQuantity.Text) & ", " & decPrice & ")"
        End If
        drCheck.Close() ' When a DataReader is open, its Connection is dedicated to the its associated SQLcommand.
        cmdSQL.CommandText = strSQLStatement
        Dim drCart As SqlDataReader
        drCart = cmdSQL.ExecuteReader(CommandBehavior.CloseConnection)
        Response.Redirect("ViewCart")
    End Sub

    Public Function GetRandomCartNoUsingGUID(ByVal length As Integer) As String
        'Get the GUID
        Dim guidResult As String = System.Guid.NewGuid().ToString()
        'Remove the hyphens
        guidResult = guidResult.Replace("-", String.Empty)
        'Make sure length is valid
        If length <= 0 OrElse length > guidResult.Length Then
            Throw New ArgumentException("Length must be between 1 and " & guidResult.Length)
        End If
        'Return the first length bytes
        Return guidResult.Substring(0, length)
    End Function
End Class