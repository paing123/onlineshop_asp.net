<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="Category.aspx.vb" Inherits="OnlineShop.Category" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta id="metaDescription" runat="server" name="Description" />
    <meta id="metaKeywords" runat="server" name="keywords" />
    <title id="dynamicTitle" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section_container">
        <!--Mid Section Starts-->
        <section>
            <!--SIDE NAV STARTS-->
            <div id="side_nav">
                <div class="sideNavCategories">
                    <h1><asp:Label ID="lblMainCategoryName" runat="server" Text=""></asp:Label></h1>
                    <ul class="category departments">
                         <asp:SqlDataSource ID="sqlDSSubCategory" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>" SelectCommand=""></asp:SqlDataSource>
	                     <asp:Repeater ID="rpSubCategory" runat="server" DataSourceID="SqlDSSubCategory">
		                    <ItemTemplate>
                                <li><a href="Category.aspx?MainCategoryID=<%# Request.QueryString("MainCategoryID") %>&MainCategoryName=<%# Trim(Request.QueryString("MainCategoryName")) %>&SubCategoryId=<%# Eval("CategoryId") %>&SubCategoryName=<%# Trim(Eval("CategoryName")) %>"><%# Trim(Eval("CategoryName")) %></a></li>
			                </ItemTemplate>
	                     </asp:Repeater> 
                    </ul>
                </div>
            </div>
            <!--SIDE NAV ENDS-->
            <!--MAIN CONTENT STARTS-->
            <div id="main_content">
                <!--Toolbar-->
                <div class="toolbar">
                    <asp:Label ID="lblSubCategoryName" runat="server" Text="" Font-Bold="True"></asp:Label>
                </div>
                <!--Toolbar-->
                <!--Product List Starts-->
                <div class="products_list products_slider">
                    <ul>
                        <asp:SqlDataSource ID="sqlDSProducts" runat="server" ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>" SelectCommand=""></asp:SqlDataSource>
                        <asp:Repeater ID="sqlProducts" runat="server" DataSourceID="sqlDSProducts">
		                    <ItemTemplate>
                                <li class="ms-0"> <a class="product_image"><img src="images/<%# (Trim(Eval("ProductNo"))) %>.jpg"/></a>
                                    <div class="product_info">
                                        <h3><%# (Trim(Eval("ProductName"))) %></h3>
                                        <small><%# (Trim(Eval("ProductDescription"))) %></small> </div>
                                        <div class="price_info" style="float:right">
                                            <% 
                                                If Session("Username") Is Nothing Then
									        %>
                                                <label class="form-label">Price : $<%# (Trim(Eval("Price"))) %></label><br/>
									        <%
                                                Else
									        %>
										        
                                                <label class="form-label">Price (20% off) : $<%# (Eval("Price")) - ((Eval("Price")) * 0.2) %></label><br/>
									        <%	
                                                End If
									        %>
                                            <a href="Product-<%# (Trim(Eval("ProductNo"))) %>" class="btn btn-info ms-3">View Detail</a>
                                        </div>
                                </li>
			                </ItemTemplate>
	                    </asp:Repeater> 
                    </ul>
                </div>
                <!--Product List Ends-->
            </div>
            <!--MAIN CONTENT ENDS-->
        </section>
        <!--Mid Section Ends-->
    </div>
</asp:Content>
