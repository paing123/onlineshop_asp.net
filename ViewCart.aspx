<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ViewCart.aspx.vb" Inherits="OnlineShop.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:SqlDataSource ID="sqlDSCart2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OnlineShopConnectionString %>"> 
    </asp:SqlDataSource>
    <asp:ListView ID="lvCart" runat="server" DataSourceID="sqlDSCart2"
            OnItemCommand="lvCart_OnItemCommand" CellPadding="3" DataKeyField="CartNo"
            CellSpacing="0" RepeatColumns="1" DataKeyNames="CartID" EmptyDataText="There are no product in the cart.">
        
<LayoutTemplate>              
    <div class="section_container"> 
    <!--Mid Section Starts-->
    <section> 
      <!--CART STARTS-->
      <div id="shopping_cart" class="full_page">
        <h1>Shopping Cart</h1>
        <div class="message success">Notch-collar shirt was added to your shopping cart.</div>
        <div class="action_buttonbar">
          <asp:Button ID="btnEmptyCart" CssClass="empty_shopping_cart" runat="server" Text="Empty Shopping Cart" OnClick="btnEmptyCart_Click"/>
          <button type="button" title="" class="checkout">Checkout</button>
        </div>
          <div style="float: right; margin: 0 30px 5px 0;">
                <asp:Label ID="lblPage" runat="server" Text="" Font-Size="14px"></asp:Label>
            </div><br />
        <div class="cart_table">
          <table class="data-table cart-table" id="shopping-cart-table" cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                  <th colspan="2">Products</th>
                  <th class="align_center" width="6%"></th>
                  <th class="align_center" width="12%">Unit Price</th>
                  <th class="align_center" width="10%">Qty</th>
                  <th class="align_center" width="12%">Subtotal</th>
                  <th class="align_center" width="6%"></th>
                </tr>
            </thead>
            <tbody>
                <asp:PlaceHolder runat="server" id="itemPlaceholder"></asp:PlaceHolder>
            </tbody>
          </table>
        </div>
        <div id="shopping_cart" class="full_page">
        <div class="totals">
        <table id="totals-table">
            <tr>
                <td width="60%" colspan="1" class="align_left" ><strong>Subtotal</strong></td>
                <td class="align_right" style=""><strong><span class="price">$<asp:Label ID="lblCartTotal" runat="server" Text=""></asp:Label></span></strong></td>
            </tr>
            <tr>
                <td width="60%" colspan="1" class="align_left" >Shipping fee</td>
                <td class="align_right" style=""><span class="price">$<asp:Label ID="lblShippingFee" runat="server" Text=""></asp:Label></span></td>
            </tr>
            <tr>
                <td width="60%" colspan="1" class="align_left total" >Grand Total</td>
                <td class="align_right" style=""><span class="total">$<asp:Label ID="lblGrandTotal" runat="server" Text=""></asp:Label></span></td>
            </tr>                
        </table>
        </div>
        </div>
      </div>
      <!--CART ENDS--> 
      </div>
    </section>
    <!--Mid Section Ends--> 
  </div>
</LayoutTemplate>
        <ItemTemplate>
            <tr>
              <td><img src="images/<%# Trim(Eval("ProductNo")) %>.jpg" /></td>
              <td class="align_left" width="44%"><a class="pr_name" href="#"><%# Trim(Eval("ProductName")) %></a><span class="pr_info">Product No. : <%# Eval("ProductNo") %></span></td>
              <td class="align_center">
                   <asp:LinkButton runat="server" ID="lbUpdate" Text='Edit' CssClass="edit"
                        CommandName="cmdUpdate" CommandArgument='<%# Eval("ProductNo")%>' />
              </td>
              <td class="align_center vline">
                  <span class="price">
                    <%  If Session("Username") Is Nothing Then  %>
                        $<%# Eval("Price") %>
                    <% Else %>
                      $<%# Eval("Price") - (Eval("Price") * 0.2) %>(20% off)
                    <% End If %>
                  </span></td>
              <td class="align_center vline">
                  <asp:TextBox ID="tbQuantity" Text='<%# Eval("Quantity")%>' Width="50px" CssClass="qty_box" runat="server"></asp:TextBox>
              </td>
              <td class="align_center vline">
                  <span class="price">
                       <%  If Session("Username") Is Nothing Then  %>
                        $<%# Eval("Quantity") * Eval("Price") %>
                       <% Else %>
                          $<%# Eval("Quantity") * (Eval("Price") - (Eval("Price") * 0.2)) %>
                       <% End If %>
                  </span>
              </td>
              <td class="align_center vline">
                  <asp:LinkButton runat="server" ID="lbDelete" CssClass="remove"
                        CommandName="cmdDelete" CommandArgument='<%# Eval("ProductNo")%>' />
              </td>
            </tr>
        </ItemTemplate>
    </asp:ListView>
    <section> 
    <!--CART STARTS-->

    </section>
    <div class="action_buttonbar" align="center">
          <asp:Button runat="server" Text="&laquo;" id="show_prev" CssClass="show_prevx"></asp:Button>
            <asp:DataPager ID="DataPagerId" runat="server" PagedControlID="lvCart" PageSize="3">
                <Fields>        
                <asp:NumericPagerField NextPageText='&raquo;' PreviousPageText='&laquo;' ButtonCount="5" 
                    ButtonType="Button" NextPreviousButtonCssClass="next_prevx" NumericButtonCssClass="numericx" 
                    CurrentPageLabelCssClass="currentx" RenderNonBreakingSpacesBetweenControls="False" />
                </Fields>
            </asp:DataPager>
            <asp:Button runat="server" Text="&raquo;" id="show_next" CssClass="show_nextx"></asp:Button>
        </div>
    <br/>
</asp:Content>
