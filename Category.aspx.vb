Public Class Category
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'from search
        If Request.QueryString("SearchString") <> "" Then
            sqlDSProducts.SelectCommand = "SELECT * FROM Product WHERE ProductName LIKE '%" & Request.QueryString("SearchString") & "%'"
            sqlProducts.DataBind()
            If Not sqlProducts.DataSource Then
                lblSubCategoryName.Text = "Search Result For : " + Request.QueryString("SearchString")
            Else
                lblSubCategoryName.Text = "No data found"
            End If
        Else
            If Request.QueryString("MainCategoryID") <> "" Then
                sqlDSSubCategory.SelectCommand = "SELECT * FROM Category WHERE Level = " & CInt(Request.QueryString("MainCategoryID"))
                sqlProducts.DataBind()
                lblMainCategoryName.Text = Request.QueryString("MainCategoryName")
                dynamicTitle.InnerHtml = Request.QueryString("MainCategoryName")
                metaKeywords.Attributes.Item("content") = "Fashion Category Keyword"
                metaDescription.Attributes.Item("content") = "Fashion Category Descirption"

                If Request.QueryString("SubCategoryID") <> "" Then
                    sqlDSProducts.SelectCommand = "SELECT * FROM Product WHERE SubcategoryId = " & CInt(Request.QueryString("SubCategoryID"))
                    sqlDSProducts.DataBind()
                    lblSubCategoryName.Text = Request.QueryString("SubCategoryName")
                    dynamicTitle.InnerHtml = Request.QueryString("MainCategoryName") + " - " + Request.QueryString("SubCategoryName")
                    metaKeywords.Attributes.Item("content") = "Fashion Category Keyword"
                    metaDescription.Attributes.Item("content") = "Fashion Category Keyword Descirption"
                Else
                    sqlDSProducts.SelectCommand = "SELECT * FROM Product WHERE Featured = 'Y' AND MaincategoryId = " & CInt(Request.QueryString("MainCategoryID"))
                    lblSubCategoryName.Text = "All Products"
                End If
            End If
        End If
    End Sub

End Class