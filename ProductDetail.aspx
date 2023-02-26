<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Layout.Master" CodeBehind="ProductDetail.aspx.vb" Inherits="OnlineShop.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <meta id="metaDescription" runat="server" name="Description" />
    <meta id="metaKeywords" runat="server" name="keywords" />
    <title id="dynamicTitle" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="section_container"> 
    <!--Mid Section Starts-->
    <section>
      <!--PRODUCT DETAIL STARTS-->
      <div id="product_detail"> 
        <!--Product Left Starts-->
        
        <div class="product_leftcol">
            <asp:Image ID="productImage" runat="server" /> <span class="pr_info">ROLL OVER IMAGE TO ZOOM </span>
        </div>
        <!--Product Left Ends--> 
        <!--Product Right Starts-->
        <div class="product_rightcol"><small class="pr_type">Product No. <asp:Label ID="lblProductNo" runat="server" Text=""></asp:Label></small>
          <h1>
              <asp:Label ID="lblProductName" runat="server" Text=""></asp:Label></h1>
          <p class="short_dc"> <asp:Label ID="lblProductDescription" runat="server" Text=""></asp:Label>
          
          <div class="pr_price"> 
              <big>$<asp:Label ID="lblPrice" runat="server" Text=""></asp:Label></big>
          </div>
          <div><lable><b>Rating : </b></lable>
              <% For i = 1 To rating  %>
                <img src="images/yellow-star.png" class="mb-1" width="30px" height="30px">
              <% Next %>
          </div>
          <br>
          <div>
            <label style="font-weight: bold"">Quantity:</label>
			<asp:TextBox ID="tbQuantity" runat="server" CssClass="form-control mt-1" Width="27%"></asp:TextBox>
          </div>
          <div class="add_to_buttons">
            <asp:Button ID="btnAddtoCart" runat="server" CssClass="add_cart" Text="Add to Cart" />
          </div>
          <div class="product_overview">
            <h4>Quick Overview</h4>
            <ul>
              <li>Long sleeves with single button cuffs.</li>
              <li>Cuffs can be rolled up and secured with button-tabs.</li>
              <li>Standing collar with notched detailing.</li>
              <li>Front button placket.</li>
              <li>Hem is longer in back.</li>
            </ul>
          </div>
        </div>
        <!--Product Right Ends--> 
        
        <!--Tabs-->
<div class="simpleTabs">
		    <ul class="simpleTabsNavigation">
		      <li><a href="#">Tab 1</a></li>
		      <li><a href="#">Tab 2</a></li>
		      <li><a href="#">Other tab</a></li>
		    </ul>
		    <div class="simpleTabsContent">
		      <p> Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Donec turpis. Fusce aliquet lorem vitae est. In hac habitasse platea dictumst. Phasellus iaculis facilisis pede. Fusce vulputate elit non magna. Nunc commodo rhoncus dolor. Integer auctor. Aliquam tincidunt purus id mauris. Vivamus eros. Vestibulum velit libero, dapibus ac, consectetuer dignissim, adipiscing sed, libero. Ut mi metus, tempor eget, aliquet sit amet, euismod ut, est. Sed nec leo eu lacus laoreet venenatis. Praesent massa sem, facilisis quis, mollis non, consequat et, sapien. Vestibulum dui sapien, sollicitudin ut, hendrerit id, cursus sed, eros. Aliquam eu purus. Proin iaculis. Vestibulum elementum metus sed ipsum. Integer facilisis. Donec aliquam ligula eu neque. Etiam urna. </p>
		      <p> Cras pretium fringilla nibh. Duis posuere. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Pellentesque semper. Ut quis arcu. Integer ac nulla. Ut auctor. Pellentesque scelerisque nisl in tortor. Integer eget purus. Ut volutpat, neque eu tincidunt tincidunt, justo tortor pretium elit, vitae varius mauris arcu a lectus. Phasellus bibendum pretium urna. Donec non quam in augue molestie congue. Aenean metus diam, volutpat vitae, tristique id, porttitor a, elit. Cras bibendum, augue non pulvinar aliquam, est nulla posuere nunc, gravida gravida magna leo nec arcu. Donec arcu mi, pellentesque quis, placerat quis, egestas id, leo. Morbi urna est, convallis eget, tristique at, egestas a, lectus.</p>
		    </div>
		    <div class="simpleTabsContent">
		      <div>
		        <div>
		          <div>
		            <div>
		              <p>Proin ullamcorper bibendum tellus. Donec vel ipsum sit amet mi convallis lacinia. Maecenas non nunc bibendum orci commodo aliquam. Integer vel justo. Sed vestibulum semper mi. Vestibulum tincidunt leo at augue. Morbi ut justo. Sed cursus, lorem nec lobortis blandit, urna nisl rhoncus erat, id vulputate dui sem sed erat. Sed velit diam, pretium in, hendrerit non, eleifend ut, nisi. Nullam at risus. Donec vitae tellus ut tellus dictum adipiscing. Sed nisi. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nullam condimentum, odio at rhoncus cursus, dolor lacus malesuada est, in pulvinar arcu justo ultricies justo. Ut sagittis luctus dui. </p>
		              <p> Maecenas fringilla diam fermentum ante. Vivamus tempor, sem vitae semper aliquam, arcu nunc pretium quam, vitae auctor sapien dolor ut lorem. Integer eros. Sed pulvinar mi eu tortor. Pellentesque faucibus neque eu erat. Nullam pulvinar, urna vitae elementum malesuada, tortor lectus consequat nulla, in pharetra augue lacus et odio. Donec enim nulla, lacinia sed, interdum non, laoreet ut, nisi. Quisque posuere, purus id pretium luctus, dui ligula porttitor neque, vitae consequat sem arcu posuere metus. Duis dictum convallis ipsum. Nulla mi. </p>
		            </div>
		          </div>
		        </div>
		      </div>
		    </div>
		    <div class="simpleTabsContent">
		      <p> Vestibulum sit amet arcu a leo dignissim lobortis. Quisque augue neque, adipiscing id, condimentum eu, congue at, pede. Vivamus rhoncus. Aliquam pulvinar justo et ligula. Pellentesque ligula elit, placerat vel, luctus ac, facilisis et, enim. Nulla malesuada venenatis metus. Etiam pellentesque tincidunt diam. Ut et pede. Cras ante. Maecenas sagittis mi vulputate neque. Aenean dignissim justo non lectus. Nulla facilisi. Maecenas enim lorem, lacinia non, bibendum at, varius consectetuer, ipsum. Fusce ut lacus in nulla rutrum pellentesque. Nunc velit. Vestibulum eleifend porta risus. Cras congue volutpat leo. Nam nec mi quis libero placerat ultrices. Nulla massa velit, scelerisque sed, rutrum in, sollicitudin nec, mi. Pellentesque imperdiet laoreet sapien. </p>
		    </div>
		  </div>
          <!--Tabs-->        
        
      </div>
      <!--PRODUCT DETAIL ENDS--> 
      <!--Product List Starts-->
      <div class="products_list products_slider">
        <h2 class="sub_title">You might also like</h2>
        <ul id="first-carousel" class="first-and-second-carousel jcarousel-skin-tango">
          <li> <a class="product_image"><img src="images/pr_l_1.jpg"/></a>
            <div class="product_info">
              <h3><a href="leisure_detail.html">CN Clogs Beach/Garden Clog</a></h3>
              <small>Comfortable and fun to wear these clogs are the latest trend in fash</small> </div>
            <div class="price_info"> <a href="#">+ Add to wishlist</a>
              <button class="price_add" title="" type="button"><span class="pr_price">$76.00</span><span class="pr_add">Add to Cart</span></button>
            </div>
          </li>
          <li> <a class="product_image"><img src="images/pr_l_2.jpg"/></a>
            <div class="product_info">
              <h3><a href="leisure_detail.html">CN Clogs Beach/Garden Clog</a></h3>
              <small>Comfortable and fun to wear these clogs are the latest trend in fash</small> </div>
            <div class="price_info"> <a href="#">+ Add to wishlist</a>
              <button class="price_add" title="" type="button"><span class="pr_price">$76.00</span><span class="pr_add">Add to Cart</span></button>
            </div>
          </li>
          <li> <a class="product_image"><img src="images/pr_l_3.jpg"/></a>
            <div class="product_info">
              <h3><a href="leisure_detail.html">CN Clogs Beach/Garden Clog</a></h3>
              <small>Comfortable and fun to wear these clogs are the latest trend in fash</small> </div>
            <div class="price_info"> <a href="#">+ Add to wishlist</a>
              <button class="price_add" title="" type="button"><span class="pr_price">$76.00</span><span class="pr_add">Add to Cart</span></button>
            </div>
          </li>
          <li> <a class="product_image"><img src="images/pr_l_5.jpg"/></a>
            <div class="product_info">
              <h3><a href="leisure_detail.html">CN Clogs Beach/Garden Clog</a></h3>
              <small>Comfortable and fun to wear these clogs are the latest trend in fash</small> </div>
            <div class="price_info"> <a href="#">+ Add to wishlist</a>
              <button class="price_add" title="" type="button"><span class="pr_price">$76.00</span><span class="pr_add">Add to Cart</span></button>
            </div>
          </li>
          <li> <a class="product_image"><img src="images/pr_l_1.jpg"/></a>
            <div class="product_info">
              <h3><a href="leisure_detail.html">CN Clogs Beach/Garden Clog</a></h3>
              <small>Comfortable and fun to wear these clogs are the latest trend in fash</small> </div>
            <div class="price_info"> <a href="#">+ Add to wishlist</a>
              <button class="price_add" title="" type="button"><span class="pr_price">$76.00</span><span class="pr_add">Add to Cart</span></button>
            </div>
          </li>
          <li> <a class="product_image"><img src="images/pr_l_2.jpg"/></a>
            <div class="product_info">
              <h3><a href="leisure_detail.html">CN Clogs Beach/Garden Clog</a></h3>
              <small>Comfortable and fun to wear these clogs are the latest trend in fash</small> </div>
            <div class="price_info"> <a href="#">+ Add to wishlist</a>
              <button class="price_add" title="" type="button"><span class="pr_price">$76.00</span><span class="pr_add">Add to Cart</span></button>
            </div>
          </li>
        </ul>
      </div>
      <!--Product List Ends--> 
      
      <!--Newsletter_subscribe Starts-->
      <div class="subscribe_block">
        <div class="find_us">
          <h3>Find us on</h3>
          <a class="twitter" href="#"></a> <a class="facebook" href="#"></a> <a class="rss" href="#"></a> </div>
        <div class="subscribe_nl">
          <h3>Subscribe to our Newsletter</h3>
          <small>Instant wardrobe updates, new arrivals, fashion news, don’t miss a beat – sign up to our newsletter now.</small>
          <form id="newsletter" method="post" action="#">
            <input type="text" class="input-text" value="Enter your email" title="Enter your email" id="newsletter" name="email">
            <button class="button" title="" type="submit"></button>
          </form>
        </div>
      </div>
      <!--Newsletter_subscribe Ends--> 
      
    </section>
    <!--Mid Section Ends--> 
  </div>
</asp:Content>
